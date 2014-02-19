build(States, Crosses, Who) :-
            crosses(Crosses), states(States),
            member([s1, S1], States), member([s2, S2], States), member([s3, S3], States), member([s4, S4], States), member([s5, S5], States), member([s6, S6], States),
            member([l1, C1], Crosses), member([r1, C4], Crosses), member([l2, C2], Crosses), member([r2, C5], Crosses), member([l3, C3], Crosses),
            lillegal(C1), rillegal(C4), lillegal(C2), rillegal(C5), lillegal(C3),
            leftcross(S1, S2, C1), rightcross(S2, S3, C4), leftcross(S3, S4, C2), rightcross(S4, S5, C5), leftcross(S5, S6, C3),
            paddled(tom, [C1, C2, C3, C4, C5]),
            paddled(elliot, [C1, C2, C3, C4, C5]),
            paddled(bill, [C1, C2, C3, C4, C5]),
            paddled(vic, [C1, C2, C3, C4, C5]),
            testpartners([C1, C2, C3, C4, C5]),
            paddletwice([C1, C2, C3, C4, C5], Who).


states([[s1, [tom, elliot, bill, vic]], [s2, _], [s3, _], [s4, _], [s5, _], [s6, []]]).
crosses([[l1, [_, _]], [r1, [_, nobody]], [l2, [_, _]],[r2, [_, nobody]], [l3, [_, _]]]).


testpartners([Head | Tail]) :- [H, T] = Head, testpartner(H, T), testpartners(Tail).
testpartners([]).
testpartner(Person, Partner) :- Person = tom, Partner = nobody.
testpartner(Person, Partner) :- Person = elliot, Partner = bill.
testpartner(Person, Partner) :- Person = bill, Partner \= bill.
testpartner(Person, Partner) :- Person = vic, Partner \= vic.

lillegal([Head, Tail]) :- member(Head, [tom, elliot, bill, vic]), member(Tail, [tom, elliot, bill, vic]).
rillegal([Head, _]) :- member(Head, [tom, elliot, bill, vic]).

remove(_, [], R) :- append([], [], R).
remove(X, [Head | Tail], R) :- X = Head, remove(X, Tail, R).
remove(X, [Head | Tail], R) :- X \= Head, remove(X, Tail, Y), append([Head], Y, R).



rightcross(State1, State2, [Head, _]) :- append([Head], State1, State2).
leftcross(State1, State2, [Head, Tail]) :- Tail \= nobody, member(Head, State1), member(Tail, State1), remove(Head, State1, X), remove(Tail, X, State2).

paddletwice(List, Who) :- takeHead(List, X), findtwice(X, Who).
paddled(Who, List) :- takeHead(List, X), contains(Who, X).

contains(_, []) :- false.
contains(X, [Head | _]) :- Head = X.
contains(X, [Head | Tail]) :- Head \= X, contains(X, Tail).

takeHead([Head | Tail], R) :- [H , _] = Head, takeHead(Tail, X), append([H], X, R).
takeHead([], R) :- append([], [], R).

findtwice([Head | Tail], R) :- member(Head, Tail), R = Head.
findtwice([Head | Tail], R) :- not(member(Head, Tail)), findtwice(Tail, R).
