:- use_module(library(csv)).

load_data :-
    csv_read_file('http_codes.csv', Rows, [functor(http_status), arity(3)]),
    maplist(assert, Rows).
