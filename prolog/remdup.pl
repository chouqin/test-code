remdup([], R) :- append([], [], R).
remdup([Head | Tail], R) :- remove(Head, Tail, X), remdup(X, Y), append([Head], Y, R).

remove(_, [], R) :- append([], [], R).
remove(X, [Head | Tail], R) :- X = Head, remove(X, Tail, R).
remove(X, [Head | Tail], R) :- X \= Head, remove(X, Tail, Y), append([Head], Y, R).

