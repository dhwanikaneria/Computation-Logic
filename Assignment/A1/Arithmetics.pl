%Assignment - 1 (Question 6 to 9)
%Computatinal Logic
%Author :- Dhwaniben Kaaneria
%Net ID :- drk170130
%Arithmetics

%Question 6 Plus ,times and greater then.

% Plus 

nat(0).
nat(s(X)):-nat(X).

plus(0,Y,Y):-nat(Y).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).

%Multiplication 

times(0,Y,0).
times(s(X),Y,A):-times(X,Y,Z),plus(Z,Y,A).

lesst(0,s(X)).
lesst(s(X),s(Y)):-lesst(X,Y).

%Greater than

greatthan(s(X),0).
greatthan(s(X),s(Y)):-greatthan(X,Y).

%Question 7 Factorial.

fact(s(0),s(0)).
%fact(s(X),Y):-times(s(X),B,Y),fact(X,B).
fact(s(X),Y):-fact(X,B),times(s(X),B,Y).


%Question 8. Computing quotient and reminder of two numbers.

division(X,Y,Q,R):-lesst(Y,X),times(Y,Q,A),plus(R,A,X),not(A=0).
%division(s(0),s(0),s(0),0).

div(X,Y,Q,R):-mul(X,Y,0,Q),plus(R,Q,X).

mul(Y,Z,s(X),A):-lesst(A,Y),mul(Y,Z,s(s(X)),A).
mul(Y,Z,s(X),A):-lesst(A,Y),times(Z,s(X),A).

%Question  9. Computing N'th fibonacci numbers.

fib(s(0),0).
fib(s(s(0)),s(0)).
fib(s(s(X)),Z):-fib(s(X),B),fib(X,A),plus(A,B,Z).


