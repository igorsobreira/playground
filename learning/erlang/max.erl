-module(max).
-export([max/1]).

max([Head|Rest]) ->
    max(Rest, Head).


max([], Result_so_far) ->
    Result_so_far;

max([Head|Rest], Result_so_far) when Head > Result_so_far ->
    max(Rest, Head);

max([Head|Rest], Result_so_far) ->
    max(Result_so_far, Rest).
    
