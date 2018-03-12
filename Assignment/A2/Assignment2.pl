%Assignment - 1 (Question 6 to 9)
%Computatinal Logic
%Author :- Dhwaniben Kaaneria
%Net ID :- drk170130
%List Processing and Efficient Arithmetic 

% Question [1] Exercise 3.2.1 : (i) 

% Exercise 3.2.1 : (ii) : -


adjacent([H,A|_],H,A).
adjacent([H|T],A,R):-adjacent(T,A,R).



lastNum([H|T],R):-lastNum(T,R).
lastNum([X],X).


% Exercise 3.2.1 : (iiii) : -


double([X],[X,X]).
double([H|T],[H,H|Z]):-double(T,Z).

% Exercise 3.2.1 : (iv) : -


 
% Question [2] Exercise 3.3.1 : (i) 


substitute(X,Y,[X|T],[Y|Z]):-substitute(X,Y,T,Z).
substitute(X,Y,[H|T],[H|Z]):-not(X==H),substitute(X,Y,T,Z).
substitute(X,Y,[R],[R]):-not(X==R).
substitute(X,Y,[X],[Y]).

% Exercise 3.3.1 : (ii) 


% Exercise 3.3.1 : (iii) 


no_doubles([H|T],[H|Z]):-not(T==Z),no_doubles(T,Z),not(member(H,Z)).
no_doubles([H|T],Z):-not(T==Z),no_doubles(T,Z),(member(H,Z)).
no_doubles([],[]).

member(X,[X|Xs]).
member(X,[Y|Ys]):-member(X,Ys).

% Exercise 3.3.1 : (v)


mergesort([X],[X]).
mergesort(List,Z):-List=[_,_|_],part(List,List,L,R),mergesort(L,Ls),mergesort(R,Rs),conquer(Ls,Rs,Z).
mergesort([],[]).

% Partition in two equal part
part([_|[_|A]],[H|B],[H|L],R):-part(A,B,L,R).
part([],R,[],R).
part([_],[H|T],[H|L],R):-part([],T,L,R).

% Merge two sorted lists
conquer([X|L],[Y|R],[X|Z]):-X=<Y,conquer(L,[Y|R],Z).
conquer([X|L],[Y|R],[Y|Z]):-X>Y,conquer([X|L],R,Z).
conquer([],Y,Y).
conquer(X,[],X).


% Exercise 3.3.1 : (vi)


% Exercise 3.3.1 : (vii) 
 
 
% Question [3] : SBT


%sumtree(T,N): N is the sum of elements in SBT T. 

sumtree(node(X,Y,Z),S):-sumtree(Y,L),plus(L,X,L1),sumtree(Z,R),plus(L1,R,S).
sumtree(node(s,nil,nil),s).
sumtree(nil,0).

plus(0,Y,Y):-nat(Y).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).

nat(0).
nat(s(X)):-nat(X). 
 
% delete(E,T,Tn): delete the element E from SBT T to obtain SBT Tn.

deletenode(E,node(E,nil,nil),nil).
deletenode(E,node(E,L,nil),L).
deletenode(E,node(E,nil,R),R).
deletenode(E,node(X,L,R),node(X,L,Z)):-E>X,deletenode(E,R,Z).
deletenode(E,node(X,L,R),node(X,Z,R)):-E<X,deletenode(E,L,Z).
deletenode(E,node(E,L,R),node(Max,Lnew,R)):-leftmax(L,Max,Lnew).

% maximum element from left branch to replace deleted node

leftmax(node(X,L,nil),X,L).
leftmax(node(X,L,R),Max,node(X,L,Rnew)):-leftmax(R,Max,Rnew).


% Question [4] Exercise 8.3.1 : (i) 


triangle(N,T):-triangle(N,0,T).
triangle(0,A,A).
triangle(N,A,Z):-N>0,N1 is N-1,B is N+A,triangle(N1,B,Z).

% Exercise 8.3.1 : (iii)


between(I,J,J):-I=<J.
between(I,J,K):-I<J,J1 is J-1,between(I,J1,K).


% Exercise 8.3.1 : (vi)


min_list([H|T],M):-min_list([H|T],H,M).
min_list([],A,A).
min_list([H|T],A,M):-H<A,min_list(T,H,M).
min_list([H|T],A,M):-H>=A,min_list(T,A,M).

% Exercise 8.3.1 : (vii)

 
lengthI([H|T],L):-lengthI([H|T],0,L).
lengthI([H|T],A,L):-A1 is A+1,lengthI(T,A1,L).
lengthI([],A,A). 

 
 
 
 
