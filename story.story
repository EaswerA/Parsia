SCENE Forest
CHARACTER Hero
CHARACTER Villain

ENTER Hero
Hero SAY "Where am I..."
Hero EMOTE thinking

WAIT 1

ENTER Villain
Villain EMOTE angry
Villain SAY "You shouldn't be here."

Hero EMOTE scared
Hero MOVE LEFT 2

WAIT 1

Villain MOVE RIGHT 2
Villain SAY "You can't escape."

Hero SAY "Watch me!"

loop 2:
    Hero MOVE LEFT 1

Hero EMOTE happy
Hero SAY "Freedom!"

EXIT Hero
EXIT Villain
