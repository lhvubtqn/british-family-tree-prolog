male(philip).
male(charles).
male(andrew).
male(edward).
male(william).
male(harry).
male(george).
male(louis).
male(archie).
male(mark).
male(timothy).
male(peter).
male(mike).
male(james).

female(elizbeth).
female(diana).
female(camilla).
female(kate).
female(meghan).
female(charlotte).
female(sarah).
female(eugenie).
female(beatrice).
female(anne).
female(autumn).
female(zara).
female(sophie).
female(louise).

parent(elizbeth, charles).
parent(elizbeth, anne).
parent(elizbeth, edward).
parent(elizbeth, andrew).
parent(philip, charles).
parent(philip, anne).
parent(philip, edward).
parent(philip, andrew).
parent(diana, william).
parent(diana, harry).
parent(charles, william).
parent(charles, harry).
parent(kate, george).
parent(kate, charlotte).
parent(kate, louis).
parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(harry, archie).
parent(meghan, archie).
parent(mark, peter).
parent(mark, zara).
parent(anne, peter).
parent(anne, zara).
parent(edward, louise).
parent(edward, james).
parent(sophie, louise).
parent(sophie, james).
parent(andrew, eugenie).
parent(andrew, beatrice).
parent(sarah, eugenie).
parent(sarah, beatrice).

married(elizbeth, philip).
married(philip, elizbeth).
married(diana, charles).
married(charles, diana).
married(camilla, charles).
married(charles, camilla).
married(kate, william).
married(william, kate).
married(harry, meghan).
married(meghan, harry).
married(mark, anne).
married(anne, mark).
married(anne, timothy).
married(timothy, anne).
married(peter, autumn).
married(autumn, peter).
married(zara, mike).
married(mike, zara).
married(andrew, sarah).
married(sarah, andrew).
married(edward, sophie).
married(sophie, edward).

divorced(charles, diana).
divorced(diana, charles).
divorced(mark, anne).
divorced(anne, mark).
divorced(andrew, sarah).
divorced(sarah, andrew).

husband(Person, Wife) :-
    male(Person),
    married(Person, Wife).
wife(Person, Husband) :-
    female(Person),
    married(Person, Husband).
father(Parent, Child) :-
    male(Parent),
    parent(Parent, Child).
mother(Parent, Child) :-
    female(Parent),
    parent(Parent, Child).
child(Child, Parent) :-
    parent(Parent, Child).
son(Child, Parent) :-
    male(Child),
    parent(Parent, Child).
daughter(Child, Parent) :-
    female(Child),
    parent(Parent, Child).
grandparent(GrandParent, GrandChild) :-
    parent(GrandParent, Parent),
    parent(Parent, GrandChild).
grandfather(GrandParent, GrandChild) :-
    male(GrandParent),
    grandparent(GrandParent, GrandChild).
grandmother(GrandParent, GrandChild) :-
    female(GrandParent),
    grandparent(GrandParent, GrandChild).
grandchild(GrandChild, GrandParent) :-
    grandparent(GrandParent, GrandChild).
grandson(GrandChild, GrandParent) :-
    male(GrandChild),
    grandparent(GrandParent, GrandChild).
granddaughter(GrandChild, GrandParent) :-
    female(GrandChild),
    grandparent(GrandParent, GrandChild).
sibling_duplicate(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.
sibling(Person1, Person2) :-
    distinct(sibling_duplicate(Person1, Person2)).
brother(Person, Sibling) :-
    male(Person),
    distinct(sibling(Person, Sibling)).
sister(Person, Sibling) :-
    female(Person),
    distinct(sibling(Person, Sibling)).
aunt_uncle(Person, NieceNephew) :-
    (sibling(Person, Sibling);
    (married(Person, Person1),
    sibling(Person1, Sibling))),
    parent(Sibling, NieceNephew).
uncle(Person, NieceNephew) :-
    male(Person),
    aunt_uncle(Person, NieceNephew).
aunt(Person, NieceNephew) :-
    female(Person),
    aunt_uncle(Person, NieceNephew).
nephew(Person, AuntUncle) :-
    male(Person),
    (
        aunt_uncle(AuntUncle, Person);
        (
            husband(Person, Wife),
            aunt_uncle(AuntUncle, Wife)
        )
    ).
niece(Person, AuntUncle) :-
    female(Person),
    (
        aunt_uncle(AuntUncle, Person);
        (
            wife(Person, Husband),
            aunt_uncle(AuntUncle, Husband)
        )
    ).

