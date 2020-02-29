% Author: Kaumudi 
% 02-29-2020
%Parse Strings
-module(test_2).

-export([mapstrings_list/2,mapstrings_list/3]).

%Map1 = #{}.
% Input : %(0000011319353459011000000000020000080403001305102808301308040804123456123456192165102801,[16,6,12,10,6,6,4,4,6,12])
% Approach 2 :
% Convert input into list of digits and slice list as per lengths


mapstrings_list(Input, S) ->
	io:format("~w~n",[S]),
	Stringed = integer_to_list(Input), % refered code for int to list conversion
	Inputnew = [list_to_integer([Char]) || Char <- Stringed],
	io:format("~p~n",[Inputnew]),
    mapstrings_list(Inputnew,S, length(Inputnew)).

mapstrings_list(Ilist, L, Length)  ->
    [H|T] = L,
	%io:format("heads = ~w~n",[H]),
	%io:format("~w~n",[T]),
	Value = string:slice(Ilist,0, H),
	RestInput = string:slice(Ilist,H+1,Length+1),
	%Store first slice as map values and continue operation
	% on RestInput
    %io:fwrite("~p~n",[maps:put(H,Value,Map1)]),
	io:format("Value = ~p~n",[Value]),
	%io:format("RestInput = ~p~n",[RestInput]),
	% trying to get rid of the extra "added in slice
    re:replace(RestInput,"\"","",[global,{return, list}]),
	[Value | mapstrings_list(RestInput,T,(Length-H))];

mapstrings_list(_Ilist, [], _Length) ->
	[_Ilist].
