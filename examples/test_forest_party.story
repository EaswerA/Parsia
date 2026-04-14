SCENE Forest
CHARACTER Alice
CHARACTER Bob
CHARACTER Charlie

ENTER Alice
Alice EMOTE happy
Alice SAY "What a beautiful forest!"

WAIT 1

ENTER Bob
Bob MOVE RIGHT 1
Bob EMOTE love
Bob SAY "It's perfect for a picnic."

ENTER Charlie
Charlie MOVE LEFT 1
Charlie EMOTE laughing
Charlie SAY "Did someone say picnic?!"

Alice EMOTE surprised
Alice SAY "Charlie! You made it!"

Alice MOVE RIGHT 1
Bob MOVE LEFT 1
Charlie MOVE RIGHT 1

Alice EMOTE happy
Bob EMOTE happy
Charlie EMOTE happy

Alice SAY "Let's party!"

loop 2:
    Alice MOVE UP 1
    Bob MOVE UP 1
    Charlie MOVE UP 1
    WAIT 1
    Alice MOVE DOWN 1
    Bob MOVE DOWN 1
    Charlie MOVE DOWN 1

EXIT Alice
EXIT Bob
EXIT Charlie
