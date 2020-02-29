% Author: Kaumudi 
% 02-29-2020
%Parse Strings
-module(test).

-export([mapstrings/2,mapstrings/3]).

%Map1 = #{}.
% Input : %(0000011319353459011000000000020000080403001305102808301308040804123456123456192165102801,[16,6,12,10,6,6,4,4,6,12])
% Approach 1:
% Read as string 
% split string at given indices based on the 
% map value lengths ( Assumming all the values are of fixed lenght)
% For example : Account Number (16), Code(6), Amount(12),
% Date_time(10), etc.
% TODO : 
% Encapsulate lenght list -> [16,6,12,10,6,6,4,4,6,12] will be constant for every run
% Avoid 0s - eliminated in this case 
% Add values to maps
% Convert required data into respective data types before storing to map
% Rectify end condition for recursion.

mapstrings(Input, S) ->
	io:format("~w~n",[S]),
	%Stringed = integer_to_list(Input),
	%Input = [list_to_integer([Char]) || Char <- Stringed],
    mapstrings(Input,S, length(integer_to_list(Input))).

mapstrings(Ilist, L, Length)  ->
    [H|T] = L,
	Value = string:slice(lists:flatten(io_lib:format("~p", [Ilist])),1, H),
	RestInput = string:slice(lists:flatten(io_lib:format("~p", [Ilist])),H+1,Length+1),
	%Store first slice as map values and continue operation
	% on RestInput
    %io:fwrite("~p~n",[maps:put(H,Value,Map1)]),
	io:format("Value = ~p~n",[Value]),
	%io:format("RestInput = ~p~n",[RestInput]),
	% trying to get rid of the extra "added in slice
    re:replace(RestInput,"\"","",[global,{return, list}]),
	[Value | mapstrings(RestInput,T,(Length-H))];

mapstrings(_Ilist, [], _Length) ->
	[_Ilist].






 