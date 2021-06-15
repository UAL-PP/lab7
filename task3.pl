% a) Construa um predicado `in_list(N, L)` que determina se um número `N` faz parte da lista `L`.

in_list(N, [H|Tail]) :-
    N == H, !;
    in_list(N, Tail).

% b) Construa um predicado `add_list(L, X)` que unifica em `X` a soma de todos os valores em `L`.

% c) Construa um predicado `number_list(N, L)` que unifica uma lista de números inteiros entre `0` e `N`.
