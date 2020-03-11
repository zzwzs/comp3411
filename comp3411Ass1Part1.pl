%08/03/2020, Jiedong Tong, Assignment1 Part1
%Assignment name: Prolog and Search
%Zid: z5176253

%Question1.1:List Processing
%Sumsq_even(Numbers, Sum) that sums the squares of only the even.
%numbers in a list of integers.

%if list is empty, the result will be 0.
sumsq_even([],0).

% if the first element is even,we will add its square with
% sumsq_even(Rest).
sumsq_even([Head | Tail], Sumsq):-
    even(Head),
    sumsq_even(Tail, S1),
    Sumsq is (Head * Head) + S1.

%if the first element is odd, we dont need to add so go next element.
sumsq_even([Head | Tail], Sumsq):-
    not(even(Head)),
    sumsq_even(Tail,Sumsq).

%if we find some elements are not number we will give a warning.
sumsq_even([Head|Tail], Sumsq):-
    not(number(Head)) -> write('INPUT INVALID').

%this is a function to determine whether the input is even or not
even(A):-
    0 is A mod 2.

%Question1.2: List Processing
% log_table(NumberList,ResultList) that binds ResultList to the list of
% pairs consisting of a number and its log, for each number in
% NumberList

%if the list is empty the result will be empty
log_table([], []).

%if the element in list is not number, we will give a warning
log_table([Head|Tail], Result):-
   not(number(Head)) -> write('INPUT INVALID'),
   break.

%if the element in list is less than 0, we will give a warning
log_table([Head|Tail], Result):-
    not(Head>0) -> write('INPUT INVALID'),
    break.

% make a new list Head2 which contains one of element in original list
% and its log. Then insert this list to Result
log_table([Head|Tail], [Head2|Result]):-
    Log is log(Head),
    Head2 = [Head, Log],
    log_table(Tail, Result).


%Question1.3: List Processing
% Any list of integers can (uniquely) be broken into "parity runs" where
% each run is a (maximal) sequence of consecutive even or odd numbers
% within the original list.

%if the original list is empty the result will be empty
paruns([],[]).

% if the first node is not odd result will be [EvenList|Result1]
% that means we will start with an even vice versa.
paruns([Head|Tail], Result):-
    oddsplit([Head|Tail], Rest, EvenList),
    evensplit(Rest, Rest1, OddList),
    (OddList = [] -> Result = [EvenList|Result1] ; EvenList = [] -> Result = [OddList | Result1] ; Result = [EvenList, OddList | Result1]),
    paruns(Rest1, Result1).

%if original list is empty then even list and rest must be empty
evensplit([],[],[]).

%if head is odd rest will be original list and result wont change
evensplit([Head|Tail], [Head1|Tail1], []):-
    Head1 = Head,
    Tail1 = Tail,
    odd(Head).

% if head is even rest will not def here and the head will be insert to
% result
evensplit([Head|Tail], Rest1, [Head|Rest]):-
    even(Head),
    evensplit(Tail, Rest1, Rest).

%if original list is empty then odd list and rest must be empty
oddsplit([],[],[]).

%if head is even rest will be original list and result wont change
oddsplit([Head|Tail], [Head1|Tail1], []):-
    Head1 = Head,
    Tail1 = Tail,
    even(Head).

% if head is odd rest will not def here and the head will be insert to
% result
oddsplit([Head|Tail], Rest1, [Head|Rest]):-
    odd(Head),
    oddsplit(Tail,Rest1, Rest).

%this is a function to determine whether the input is even or not
%even(Num):-
%    0 is Num mod 2.

%this is a function to determine whether the input is odd or not
odd(Num):-
    1 is Num mod 2.


%Question1.4: Prolog Terms
% eval(Num, Res) is to evaluate the value of a complex mathematical
% formulas(may contains add, sub, mul, div)

%if the formula is a number, this number will be result
eval(Num, Res):-
    number(Num),
    Res is Num.

%if the formula is to add, we will add first and second element
eval(add(Num1, Num2), Res):-
    eval(Num1, Num3),
    eval(Num2, Num4),
    Res is Num3 + Num4.

%if the formula is to substract, we will ...
eval(sub(Num1, Num2), Res):-
    eval(Num1, Num3),
    eval(Num2, Num4),
    Res is Num3 - Num4.

%if the formula is to multip, we will ...
eval(mul(Num1, Num2), Res):-
    eval(Num1, Num3),
    eval(Num2, Num4),
    Res is Num3 * Num4.

%if the formula is to divided, we will ...
eval(div(Num1, Num2), Res):-
    eval(Num1, Num3),
    eval(Num2, Num4),
    Res is Num3 / Num4.


