# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Parsia** is a compiler for a custom `.story` scripting language that generates JSON animation sequences, visualized through an HTML5 canvas renderer (`index.html`). Built as a Compiler Design course project (23CSE314).

- Language: Python 3.13.2+ (no external dependencies)
- Single main source file: `story_compiler.py` (~1518 lines)

## Running the Compiler

```bash
# Compile a story file
python story_compiler.py story.story

# Compile with named output
python story_compiler.py story.story -o animation.json

# Verbose mode — prints token stream and IR instructions
python story_compiler.py story.story -v
```

After compiling, open `index.html` in a browser to visualize the generated `animation.json`.

There is no test suite, linter, or build system. Manual testing is done by compiling `story.story` and inspecting the JSON output and animation.

## Compiler Pipeline

The compiler in `story_compiler.py` runs 7 sequential phases — each implemented as a class:

| Phase | Class | Input → Output |
|-------|-------|----------------|
| 1. Lexing | `Lexer` | `.story` source → token stream (handles INDENT/DEDENT) |
| 2–3. Parsing | `Parser` | Tokens → AST nodes |
| 4. Semantic Analysis | `SemanticAnalyser` | AST → validated AST; checks declarations, on-stage state, types |
| 5. IR Generation | `IRGenerator` | AST → three-address code (`IRInstr` list); hoists tasks to front |
| 6. Optimization | `IROptimizer` | IR → optimized IR (constant folding, dead store elimination, peephole) |
| 7. Code Generation | `CodeGenerator` | IR → JSON action list (interprets IR at runtime, builds animation) |

All phases are orchestrated in `compile_story()` at the bottom of the file.

## `.story` Language Reference

**Declarations (must appear before use):**
```
SCENE <name>
CHARACTER <name>
task <name>:
    ...
```

**Stage actions:**
```
ENTER <character>
EXIT <character>
<character> SAY "<text>"
<character> MOVE LEFT|RIGHT|UP|DOWN <steps>
<character> EMOTE happy|sad|angry|scared|surprised|thinking|wave|jump
WAIT <seconds>
```

**Control flow (Python-style indentation):**
```
let <var> = <expr>
set <var> = <expr>
if <condition>:
    ...
else:
    ...
loop <count>:
    ...
repeat:
    ...
until <condition>
do <taskname>
return <value>
print <value>
```

## Key Architectural Details

- **AST nodes** are plain Python objects defined as classes (e.g., `SayNode`, `MoveNode`, `LoopNode`).
- **IR instructions** (`IRInstr`) use opcodes like `ENTER`, `EXIT`, `SAY`, `MOVE`, `EMOTE`, `WAIT`, `BINOP`, `LOAD_CONST`, `LOAD_VAR`, `STORE_VAR`, `LABEL`, `JMP`, `JMP_FALSE`, `CALL_TASK`, `RETURN`.
- **Task hoisting**: `IRGenerator` moves all task-body instructions to the front of the IR stream, with labels, so `CALL_TASK` can jump to them.
- **CodeGenerator interprets IR** rather than emitting native code — it walks the instruction list, maintains an environment dict for variables, tracks which characters are on-stage, and appends animation action dicts to a list.
- **Output format** (`animation.json`):
  ```json
  {
    "scene": "...",
    "characters": ["..."],
    "actions": [{"type": "enter"|"exit"|"say"|"move"|"emote"|"wait", ...}]
  }
  ```

## Error Types

- `LexerError` — tokenization failure (reports line/column)
- `ParseError` — syntax error (reports offending token)
- `SemanticError` — undeclared character/variable/task, on-stage violations
- `RuntimeError_` — IR execution failure (undefined variable, unknown opcode)
