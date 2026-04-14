SCENE Castle
CHARACTER King
CHARACTER Demon
CHARACTER Hero

ENTER King
King EMOTE tired
King SAY "Heavy is the head that wears the crown..."

WAIT 1

ENTER Demon
Demon EMOTE evil
Demon MOVE RIGHT 2
Demon SAY "Your reign ends tonight, old man."

King EMOTE scared
King MOVE LEFT 2
King SAY "Guards! Help!"

WAIT 1

ENTER Hero
Hero EMOTE angry
Hero SAY "Not so fast, Demon!"

Demon EMOTE surprised
Demon MOVE RIGHT 1
Demon SAY "Who dares?!"

Hero MOVE RIGHT 2
Hero SAY "Be gone!"

EXIT Demon
WAIT 1

King EMOTE happy
King SAY "You saved the kingdom!"
Hero EMOTE happy
Hero SAY "Just doing my job."

EXIT King
EXIT Hero
