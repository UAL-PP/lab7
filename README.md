---
geometry: margin=2cm
---
# [Paradigmas de Programação 2020/2021](https://elearning.ual.pt/course/view.php?id=1946), [UAL](https://autonoma.pt/)

## Laboratório 7: Prolog

Este laboratório apresenta um conjunto de exercícios a resolver com Prolog (`SWI Prolog`).

### Referências

- [SWI Prolog](https://www.swi-prolog.org/)
- [VSC-Prolog](https://marketplace.visualstudio.com/items?itemName=arthurwang.vsc-prolog)

### Contexto

Prolog é uma implementação do paradigma de programação lógica. 

A linguagem permite declarar asserções sobre uma determinada base de conhecimento, que implicitamente define uma árvore. Prolog permite interrogar essa árvore com expressões que têm ou não uma solução (i.e., um conjunto de fatos que determinam que a 
expressão é verdadeira), implementando um algoritmo de *backtracking*, que efetua um percurso infixo na árvore à procura de 
soluções, eventualmente sujeito a restrições.

Após a instalação, o SWI Prolog inclui, um interpretador/compilador e debugger, um conjunto de bibliotecas, e um editor de texto.

Cada expressão/instrução Prolog termina com um ponto final.

Cada ficheiro de código Prolog deve ter a extensão `.pl`. No interpretador, um ficheiro `code.pl` pode ser importado com `[code].`. Durante a sessão, as modificações a `code.pl`, ou qualquer outro ficheiro consultado, podem ser atualizadas no interpretador com `make.`.

Durante a sessão, a instrução `trace.` permite observar o comportamento de *backtracking*  do interpretador.

A construção de código pode ser facilitada recorrendo ao Visual Studio Code, com a extensão [VSC-Prolog](https://marketplace.visualstudio.com/items?itemName=arthurwang.vsc-prolog).

- `alt-x l`: Iniciar um interpretador, consultando o ficheiro atual;
- `ctrl-ç`: Foca o terminal;
- `ctrl-1`: Foca o editor.

## Tarefas

## Tarefa 1

Consulte a base de conhecimento `nfl.pl`, que contém a listagem de equipas na NFL, e o calendário para a primeira semana da época de 2021/2022.

Construa os seguintes predicados:

a) `where(Visitor, Host, Stadium)` que encontra o estádio (`Stadium`) onde o encontro entre `Visitor` (joga fora) e `Host` (joga em casa) irá decorrer.

b) `stadiums_open(Date, Stadium)` que encontra os estádios com encontros na data indicada.

c) `conf_stadiums_open(Conf, Date, Stadium)` que encontra estádios cuja equipa a jogar em casa é da conferência `Conf`.

d) `cross_conf_stadiums(Stadium)` que encontra estádios que são a casa de equipas das duas conferências (*afc* e *nfc*).

## Tarefa 2

a) Escreva um predicado `add_series(N, X)`, para calcular a soma de todos os números inteiros entre `0` e `N`.

b) Construa um predicado `sdop_zeros(A, B, C, Y)` que encontra as raízes de um polinómio do segundo grau.

<img src="https://render.githubusercontent.com/render/math?math=ax%5E2%20%2B%20bx%20%2B%20c%20%3D%200 \Leftrightarrow x = -b \pm \frac{\sqrt{b^2 - 4ac}}{2a}">

c) Construa um predicado `fibo(N, X)` que encontra o valor `X`, ordem `N`, na sequência de Fibonnacci:

<img src="https://render.githubusercontent.com/render/math?math=F_0 = 0, F_1 = 1, F_n = F_{n-1} %2B F_{n-2}">

## Tarefa 3

a) Construa um predicado `in_list(N, L)` que determina se um número `N` 
faz parte da lista `L`.

b) Construma um predicado `add_list(L, X)` que unifica em `X` a soma de todos os valores em `L`.

b) Construa um predicado `number_list(N, L)` que unifica uma lista de números inteiros entre `0` e `N`.

## Tarefa 4

Consulte o ficheiro `http_codes.csv`, importando cada linha como um novo fato.

O interpretador exige que os fatos sejam importados de um ficheiro. Trata-se de uma regra geral, mas é certamente possível acrescentar fatos dinamicamente.

Para adicionar um termo dinamicamente recorremos a `assert`, e.g.,

```prolog
1 ?- assert(sample(1)).
true.

2 ?- sample(X).
X = 1.
```

Pretendemos importar cada linha do ficheiro como um novo fato, i.e., aplicar o predicado `assert` iterativamente.

Para ler ficheiros `csv` é necessário utilizar a biblioteca `csv`, disponível em SWI Prolog.

```prolog
:- use_module(library(csv)).
```

O predicado `csv_read_file` unifica em `Rows` uma *lista* de termos `http_status`, que serão mapeados para o predicado `assert`.

```prolog
load_data :-
    csv_read_file('http_codes.csv', Rows, [functor(http_status), arity(3)]),
    maplist(assert, Rows).
```

a) Após importação dinâmica de fatos, construa um predicado `wcode(Code)` que, recorrendo a `write`, *imprime no terminal* descrição do código `Code`.

b) Construa um novo predicato `fcode(Code)` que, recorrendo a `format`, mostra o tipo, código, e descrição do código `Code`.