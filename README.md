# PARSIA v1.0 — Script to Scene Engine

**Parsia** is a high-fidelity, dual-environment animation system designed to bridge the gap between narrative scripting and automated visual storytelling. It features a custom Domain-Specific Language (DSL) that compiles high-level human-readable scripts into structured character animations, cinematic environmental effects, and synchronized dialogue.

---

## Project Architecture

The Parsia ecosystem is divided into two primary components:

### 1. The Python Compiler (`story_compiler.py`)
A robust 7-phase compilation pipeline that transforms `.story` scripts into validated JSON instruction sets.
- **Lexical Analysis**: Custom scanner handling indentation-based scoping.
- **Parsing**: Recursive-descent parser generating a structured AST.
- **Semantic Analysis**: State-aware validation (declaration checking, character stage-presence tracking).
- **IR Generation**: Lowering AST to a linear Three-Address Code (TAC) format.
- **Optimization**: Constant folding, Dead Store Elimination, and Peephole optimizations.
- **Code Generation**: Final emission of the Parsia Animation JSON spec.

### 2. The Animation Studio (`index.html`)
A premium, browser-based 3D workspace (2.5D visual shell) that serves as the engine's frontend.
- **Studio UI**: Dark glassmorphism interface with real-time logging.
- **In-Browser Compiler**: A full JavaScript port of the Python 7-phase pipeline allows for direct script editing and compilation inside the browser.
- **Visual Engine**: Dynamic canvas-based rendering of Procedural Environments (Forest, City, Castle) and Articulated Character Models.
- **Action Queue**: Real-time visualization of the instruction pipeline.

---

## Getting Started

### Prerequisites
- Python 3.10+ (for the CLI compiler)
- A modern web browser (Chrome/Edge/Firefox)

### 1. Compiling a Script
Use the Python CLI to compile your narrative:
```bash
python story_compiler.py story.story -o animation.json
```

### 2. Visualizing the Scene
Simply open `index.html` in your browser. 
- Click **"Enter Studio"** to reveal the workspace.
- **Drag and Drop** any generated `.json` file from the `examples/` folder onto the window.
- Or, use the **Compiler Tab** on the right to write and run scripts directly in the browser!

---

## `.story` Language Reference

```story
SCENE Forest
CHARACTER Hero
CHARACTER Shadow

ENTER Hero
Hero SAY "The dawn is breaking..."
Hero EMOTE happy

WAIT 1

ENTER Shadow
Shadow EMOTE evil
Shadow SAY "It is the last dawn you'll see."

loop 2:
    Hero MOVE LEFT 1
    Shadow MOVE RIGHT 1

Hero SAY "Watch me!"
EXIT Hero
```

---

## Project Structure
- `index.html`: The main Animation Studio & Engine.
- `story_compiler.py`: The production CLI compiler.
- `story.story`: Default demo script.
- `animation.json`: The standard animation output.
- `examples/`: A curated collection of demo scripts (Castle Battle, City Noir, etc.).
- `assets/`: Project branding and aesthetic assets.

---

*Developed as a Compiler Design Research Project (23CSE314).*
