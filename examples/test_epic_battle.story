SCENE Castle

CHARACTER TheDarkLord
CHARACTER Knight
CHARACTER Mage
CHARACTER Archer
CHARACTER Healer

task dramatic_entry:
    TheDarkLord EMOTE evil
    TheDarkLord SAY "This castle will fall tonight!"
    TheDarkLord MOVE LEFT 1

task heroic_charge:
    Knight EMOTE angry
    Mage EMOTE angry
    Archer EMOTE angry
    Knight MOVE RIGHT 1
    Mage MOVE RIGHT 1
    Archer MOVE RIGHT 1

ENTER TheDarkLord
TheDarkLord MOVE RIGHT 1
TheDarkLord EMOTE laughing

do dramatic_entry

WAIT 1

ENTER Knight
Knight SAY "Not on our watch, fiend!"
ENTER Mage
Mage SAY "Your dark magic ends here."
ENTER Archer
Archer SAY "I have you in my sights."

TheDarkLord EMOTE surprised
TheDarkLord SAY "Fools! You dare challenge me?"

do heroic_charge

TheDarkLord EMOTE evil
TheDarkLord SAY "You are resilient... but weak!"

loop 2:
    TheDarkLord MOVE LEFT 1
    Knight MOVE LEFT 1
    Mage MOVE LEFT 1
    WAIT 1
    TheDarkLord MOVE RIGHT 1
    Knight MOVE RIGHT 1
    Mage MOVE RIGHT 1

Knight EMOTE tired
Knight SAY "He's too strong... we need backup!"
Mage EMOTE scared
Archer EMOTE scared

WAIT 1
ENTER Healer
Healer EMOTE love
Healer MOVE RIGHT 3
Healer SAY "I am here! Stand strong, heroes!"

TheDarkLord EMOTE scared
TheDarkLord SAY "No! A Light wielder!"

Healer EMOTE happy
Knight EMOTE happy
Mage EMOTE happy

Knight SAY "Now's our chance! Push him back!"

loop 3:
    Knight MOVE LEFT 1
    Mage MOVE LEFT 1
    TheDarkLord MOVE LEFT 1

TheDarkLord EMOTE tired
TheDarkLord SAY "This... isn't over."
TheDarkLord MOVE LEFT 2
EXIT TheDarkLord

WAIT 1

Knight EMOTE laughing
Mage EMOTE happy
Archer EMOTE happy
Healer EMOTE love

Knight SAY "We did it! The realm is safe."
Healer SAY "Well fought, everyone."

EXIT Knight
EXIT Mage
EXIT Archer
EXIT Healer
