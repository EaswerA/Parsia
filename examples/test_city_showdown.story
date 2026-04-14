SCENE City
CHARACTER Detective
CHARACTER Shadow

ENTER Detective
Detective MOVE RIGHT 2
Detective EMOTE thinking
Detective SAY "The neon streets are quiet tonight..."

WAIT 1

ENTER Shadow
Shadow EMOTE evil
Shadow SAY "Too quiet, Detective!"

Detective EMOTE surprised
Detective MOVE LEFT 1
Detective SAY "I knew you were behind this."

Shadow EMOTE angry
Shadow SAY "You can't stop me!"

loop 3:
    Shadow MOVE LEFT 1
    Shadow MOVE RIGHT 1

Detective EMOTE angry
Detective SAY "I'm taking you down."

EXIT Shadow
WAIT 1
Detective EMOTE tired
Detective SAY "Another long night..."
EXIT Detective
