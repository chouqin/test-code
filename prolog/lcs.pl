lcs([Head1 | Tail1], [Head2 | Tail2], R) :- Head1 = Head2, lcs(Tail1, Tail2, T), append([Head1], T, R).
lcs([Head1 | Tail1], [Head2 | Tail2], R) :- Head1 \= Head2, lcs([Head1 | Tail1], Tail2, T1), lcs(Tail1, [Head2 | Tail2], T2), max(T1, T2, R).
lcs([], _, R) :- append([], [], R).
lcs(_, [], R) :- append([], [], R).

max(T1, T2, R) :- length(T1, L1), length(T2, L2), L1 > L2, append([], T1, R).

max(T1, T2, R) :- length(T1, L1), length(T2, L2), L1 =< L2, append([], T2, R).
