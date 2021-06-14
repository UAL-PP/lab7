% a) Escreva um predicado `add_series(N, X)`, para calcular a soma de todos os números inteiros entre `0` e `N`.

add_series(0, 0) :- !.
add_series(N, X) :-
    N1 is N - 1,
    add_series(N1, X1),
    X is X1 + N.

% add_series(3, X) ----> X = X1 + 3, X1 == [2, 1]
% N == 3 : 3, 2, 1, 0, -1, -2 ... -inf
% N ==5 --> 5 + 4+ 3+ 2+ 1 +0 == 15

% b) Construa um predicado `sdop_zeros(A, B, C, Y)` que encontra as raízes de um polinómio do segundo grau.

sdop_zeros(A, B, C, Y) :-
    Y is - B + sqrt(B*B - 4*A*C) / (2*A).

sdop_zeros(A, B, C, Y) :-
    Y is - B - sqrt(B*B - 4*A*C) / (2*A).

% c) Construa um predicado `fibo(N, X)` que encontra o valor `X`, ordem `N`, na sequência de Fibonnacci:

fibo(0, 0) :- !.
fibo(1, 1) :- !.
fibo(N, X) :-
    N1 is N - 1,
    N2 is N - 2, 
    fibo(N1, X1),
    fibo(N2, X2),
    X is X1 + X2.