-module(len).
-export([len/1]).

len(1) ->
    1;
len([First | Rest]) -> 
    1 + len(Rest).

io:format("len 1 ~w~n", [hello]). 
