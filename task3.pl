% a) Construa um predicado `in_list(N, L)` que determina se um número `N` faz parte da lista `L`.

in_list(_, []) :- 
    fail.

in_list(N, [H|Tail]) :-
    N == H, !;
    in_list(N, Tail).

% b) Construa um predicado `add_list(L, X)` que unifica em `X` a soma de todos os valores em `L`.

add_list([], 0).
add_list([H|Tail], X) :-
    add_list(Tail, XT),
    X is XT + H.

% c) Construa um predicado `number_list(N, L)` que unifica uma lista de números inteiros entre `0` e `N`.

add_to_list(N, L, X) :- append([N], L, X).

number_list(0, [0]) :- !.
number_list(N, L) :-
    N1 is N - 1,
    number_list(N1, L1),
    add_to_list(N, L1, L).