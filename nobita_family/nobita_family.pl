birth_year(nobikichi, 1920).
birth_year(kuchisake, 1923).
birth_year(nobiru, 1945).
birth_year(obachan, 1942).
birth_year(minato, 1949).
birth_year(daruma, 1950).
birth_year(onna, 1965).
birth_year(kensuki, 1960).
birth_year(munashi, 1971).
birth_year(nobirou, 1972).
birth_year(aiko, 1980).
birth_year(nobisuke, 1975).
birth_year(tamako, 1975).
birth_year(tamao, 1978).
birth_year(mindaru, 1986).
birth_year(mayumi, 1982).
birth_year(montaro, 1993).
birth_year(satoshi, 2000).
birth_year(ayumi, 2002).
birth_year(nobita, 1999).
birth_year(shizuka, 1999).
birth_year(saitama, 2004).
birth_year(yukari, 2024).
birth_year(nobisake, 2022).
birth_year(nobitari, 2047).
birth_year(hanako, 2053).
birth_year(sawashi, 2070).
birth_year(temari, 2074).
birth_year(sewashi, 2112).

male(nobikichi).
male(nobiru).
male(munashi).
male(kensuki).
male(nobirou).
male(satoshi).
male(nobisuke).
male(minato).
male(nobita).
male(mindaru).
male(saitama).
male(nobisake).
male(nobitari).
male(sawashi).
male(sewashi).

female(kuchisake).
female(obachan).
female(onna).
female(montaro).
female(ayumi).
female(aiko).
female(tamako).
female(yukari).
female(daruma).
female(tamao).
female(mayumi).
female(shizuka).
female(hanako).
female(temari).

married(nobikichi, kuchisake).
married(kuchisake, nobikichi).
married(nobiru, obachan).
married(obachan, nobiru).
married(onna, kensuki).
married(kensuki, onna).
married(nobirou, aiko).
married(aiko, nobirou).
married(nobisuke, tamako).
married(tamako, nobisuke).
married(minato, daruma).
married(daruma, minato).
married(mayumi, mindaru).
married(mindaru, mayumi).
married(nobita, shizuka).
married(shizuka, nobita).
married(nobisake, yukari).
married(yukari, nobisake).
married(nobitari, hanako).
married(hanako, nobitari).
married(sawashi, temari).
married(temari, sawashi).

parent(nobikichi, nobiru).
parent(kuchisake, nobiru).
parent(nobiru, onna).
parent(nobiru, munashi).
parent(nobiru, nobirou).
parent(nobiru, nobisuke).
parent(obachan, onna).
parent(obachan, munashi).
parent(obachan, nobirou).
parent(obachan, nobisuke).
parent(onna, montaro).
parent(onna, satoshi).
parent(kensuki, montaro).
parent(kensuki, satoshi).
parent(nobirou, ayumi).
parent(aiko, ayumi).
parent(minato, tamako).
parent(minato, tamao).
parent(minato, mindaru).
parent(daruma, tamako).
parent(daruma, tamao).
parent(daruma, mindaru).
parent(nobisuke, nobita).
parent(tamako, nobita).
parent(mayumi, saitama).
parent(mindaru, saitama).
parent(nobita, nobisake).
parent(shizuka, nobisake).
parent(nobisake, nobitari).
parent(yukari, nobitari).
parent(nobitari, sawashi).
parent(hanako, sawashi).
parent(sawashi, sewashi).
parent(temari, sewashi).

older(Person1, Person2) :-
    birth_year(Person1, Year1),
    birth_year(Person2, Year2),
    Year1 < Year2.
younger(Person1, Person2) :- 
    birth_year(Person1, Year1),
    birth_year(Person2, Year2),
    Year1 > Year2.
same_age(Person1,Person2) :-
    not(older(Person1, Person2)),
    not(younger(Person1, Person2)).

husband(Person, Wife) :-
    male(Person),
    married(Person, Wife).
wife(Person, Husband) :-
    female(Person),
    married(Person, Husband).
spouse(Person1, Person2) :-
    married(Person1, Person2).

father(Person, Child) :-
    male(Person),
    parent(Person, Child).
mother(Person, Child) :-
    female(Person),
    parent(Person, Child).
child(Person, Parent) :-
    parent(Parent, Person).
oldest_child(Person, Parent) :-
    parent(Parent, Person),
    forall(
        parent(Parent, Sibling),
        (older(Person, Sibling); same_age(Person, Sibling))
    ).
oldest_child(Person) :-
    parent(Parent, Person),
    oldest_child(Person, Parent).
youngest_child(Person, Parent) :-
    parent(Parent, Person),
    forall(
        parent(Parent, Sibling),
        (younger(Person, Sibling); same_age(Person, Sibling))
    ).
youngest_child(Person) :-
    parent(Parent, Person),
    youngest_child(Person, Parent).
son(Child, Parent) :-
    male(Child),
    parent(Parent, Child).
daughter(Child, Parent) :-
    female(Child),
    parent(Parent, Child).

grandparent(Person, GrandChild) :-
    parent(Person, Parent),
    parent(Parent, GrandChild).
grandfather(Person, GrandChild) :-
    male(Person),
    grandparent(Person, GrandChild).
grandmother(Person, GrandChild) :-
    female(Person),
    grandparent(Person, GrandChild).
grandchild(Person, GrandParent) :-
    grandparent(GrandParent, Person).
grandson(Person, GrandParent) :-
    male(Person),
    grandparent(GrandParent, Person).
granddaughter(Person, GrandParent) :-
    female(Person),
    grandparent(GrandParent, Person).

great_grandparent(Person, GreatGrandChild) :-
    parent(Parent, GreatGrandChild),
    grandparent(Person, Parent).
great_grandfather(Person, GreatGrandChild) :-
    male(Person),
    great_grandparent(Person, GreatGrandChild).
great_grandmother(Person, GreatGrandChild) :-
    female(Person),
    great_grandparent(Person, GreatGrandChild).
great_grandchild(Person, GreatGrandParent) :-
    great_grandparent(GreatGrandParent, Person).
great_grandson(Person, GreatGrandParent) :-
    male(Person),
    great_grandparent(GreatGrandParent, Person).
great_granddaughter(Person, GreatGrandParent) :-
    female(Person),
    great_grandparent(GreatGrandParent, Person).

ancestor(Person, Descendant) :-
    great_grandparent(Person, Descendant).
ancestor(Person, Descendant) :-
    parent(Person, Ancestor),
    ancestor(Ancestor, Descendant).
descendant(Person, Ancestor) :-
    ancestor(Ancestor, Person).

sibling_duplicate(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.
sibling(Person1, Person2) :-
    distinct(sibling_duplicate(Person1, Person2)).

brother(Person, Brother) :-
    male(Person),
    distinct(sibling(Person, Brother)).
older_brother(Person, Brother) :-
    brother(Person, Brother),
    older(Person, Brother).
younger_brother(Person, Brother) :-
    brother(Person, Brother),
    younger(Person, Brother).
sister(Person, Sister) :-
    female(Person),
    distinct(sibling(Person, Sister)).
older_sister(Person, Sister) :-
    sister(Person, Sister),
    older(Person, Sister).
younger_sister(Person, Sister) :-
    brother(Person, Sister),
    younger(Person, Sister).

aunt_uncle(Person, NieceNephew) :-
    sibling(Person, Sibling),
    parent(Sibling, NieceNephew).
uncle(Person, NieceNephew) :-
    male(Person),
    aunt_uncle(Person, NieceNephew).
aunt(Person, NieceNephew) :-
    female(Person),
    aunt_uncle(Person, NieceNephew).
nephew(Person, AuntUncle) :-
    male(Person),
    aunt_uncle(AuntUncle, Person).
niece(Person, AuntUncle) :-
    female(Person),
    aunt_uncle(AuntUncle, Person).

grand_aunt_uncle(Person, GrandNieceNephew) :-
    sibling(Person, GrandParent),
    grandparent(GrandParent, GrandNieceNephew).
grand_uncle(Person, GrandNieceNephew) :-
    male(Person),
    grand_aunt_uncle(Person, GrandNieceNephew).
grand_aunt(Person, GrandNieceNephew) :-
    female(Person),
    grand_aunt_uncle(Person, GrandNieceNephew).
grand_nephew(Person, GrandAuntUncle) :-
    male(Person),
    grand_aunt_uncle(GrandAuntUncle, Person).
grand_niece(Person, GrandAuntUncle) :-
    female(Person),
    grand_aunt_uncle(GrandAuntUncle, Person).

great_grand_aunt_uncle(Person, GreatGrandNieceNephew) :-
    sibling(Person, GreatGrandParent),
    great_grandparent(GreatGrandParent, GreatGrandNieceNephew).
great_grand_uncle(Person, GreatGrandNieceNephew) :-
    male(Person),
    great_grand_aunt_uncle(Person, GreatGrandNieceNephew).
great_grand_aunt(Person, GreatGrandNieceNephew) :-
    female(Person),
    great_grand_aunt_uncle(Person, GreatGrandNieceNephew).
great_grand_nephew(Person, GreatGrandAuntUncle) :-
    male(Person),
    great_grand_aunt_uncle(GreatGrandAuntUncle, Person).
great_grand_niece(Person, GreatGrandAuntUncle) :-
    female(Person),
    great_grand_aunt_uncle(GreatGrandAuntUncle, Person).

cousin(Person1, Person2) :-
    aunt_uncle(AuntUncle, Person1),
    parent(AuntUncle, Person2).   
cousin(Person1, Person2) :-
    parent(Parent1, Person1),
    parent(Parent2, Person2),
    cousin(Parent1, Parent2).

blood_relation_duplicate(Person1, Person2) :-
    sibling(Person1, Person2).
blood_relation_duplicate(Person1, Person2) :-
    parent(Person1, Person2);
    parent(Person2, Person1).
blood_relation_duplicate(Person1, Person2) :-
    grandparent(Person1, Person2);
    grandparent(Person2, Person1).
blood_relation_duplicate(Person1, Person2) :-
    ancestor(Person1, Person2);
    ancestor(Person2, Person1).
blood_relation_duplicate(Person1, Person2) :-
    ancestor(Ancestor, Person1),
    ancestor(Ancestor, Person2).
blood_relation_duplicate(Person1, Person2) :-
    aunt_uncle(Person1, Person2);
    aunt_uncle(Person2, Person1).
blood_relation_duplicate(Person1, Person2) :-
    grand_aunt_uncle(Person1, Person2);
    grand_aunt_uncle(Person2, Person1).
blood_relation_duplicate(Person1, Person2) :-
    great_grand_aunt_uncle(Person1, Person2);
    great_grand_aunt_uncle(Person2, Person1).
blood_relation(Person1, Person2) :-
    distinct(blood_relation_duplicate(Person1, Person2)),
    Person1 \= Person2.

relative_duplicate(Person1, Person2) :-
    blood_relation(Person1, Person2).
relative_duplicate(Person1, Person2) :-
    spouse(Person1, Spouse),
    blood_relation(Spouse, Person2).
relative_duplicate(Person1, Person2) :-
    spouse(Person2, Spouse),
    blood_relation(Spouse, Person1).
relative_duplicate(Person1, Person2) :-
    spouse(Person1, Spouse1),
    spouse(Person2, Spouse2),
    blood_relation(Spouse1, Spouse2).
relative(Person1, Person2) :-
    distinct(relative_duplicate(Person1, Person2)),
    not(sibling(Person1, Person2)),
    not(parent(Person1, Person2)),
    not(parent(Person2, Person1)),
    not(grandparent(Person1, Person2)),
    not(grandparent(Person2, Person1)),
    not(ancestor(Person1, Person2)),
    not(ancestor(Person2, Person1)).