%Merge Sort
mergesort([X],[X]).
mergesort(List,Z):-List=[_,_|_],part(List,List,L,R),mergesort(L,Ls),mergesort(R,Rs),conquer(Ls,Rs,Z).
mergesort([],[]).

part([_|[_|A]],[H|B],[H|L],R):-part(A,B,L,R).
part([],R,[],R).
part([_],[H|T],[H|L],R):-part([],T,L,R).

conquer([X|L],[Y|R],[X|Z]):-X=<Y,conquer(L,[Y|R],Z).
conquer([X|L],[Y|R],[Y|Z]):-X>Y,conquer([X|L],R,Z).
conquer([],Y,Y).
conquer(X,[],X).