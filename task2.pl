% a) Escreva um predicado `add_series(N, X)`, para calcular a soma de todos os números inteiros entre `0` e `N`.

% N == 3, então temos que somar 0,1,2,3 == 6

add_series(0, 0) :- !.
add_series(N, X) :-
    % writeln(N),
    N1 is N - 1,
    add_series(N1, X1),
    X is N + X1.

% add_series(Acc, N, N, Acc).

% add_series(Acc, CurrentN, FinalN, X) :-
%     Acc1 is Acc + 1,
%     NextN is CurrentN + 1,
%     NextN =< FinalN,
%     add_series(Acc1, NextN, FinalN, X).

% add_series(N, X) :-
%     add_series(0, 0, N, X). 

% b) Construa um predicado `sdop_zeros(A, B, C, Y)` que encontra as raízes de um polinómio do segundo grau.

sdop_zeros(A, B, C, Y) :- Y is -B + sqrt(B*B - 4*A*C) / (2*A).
sdop_zeros(A, B, C, Y) :- Y is -B - sqrt(B*B - 4*A*C) / (2*A).

% c) Construa um predicado `fibo(N, X)` que encontra o valor `X`, ordem `N`, na sequência de Fibonnacci:

% N = 0 1 2 3 4 5 6
% X = 0 1 1 2 3 5 8

fibo(0, 0) :- !.
fibo(1, 1) :- !.
fibo(N, X) :-
    % N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibo(N1, F1),
    fibo(N2, F2),
    X is F1 + F2.
