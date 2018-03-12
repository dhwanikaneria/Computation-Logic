solve([S,E,N,D,M,O,R,Y]):-digit(S),digit(E),digit(N),digit(D),digit(M),digit(O),digit(R),digit(Y),Y is (D+E) mod 10,
C1 is (D+E) //10,
E is (C1+N+R) mod 10,
C2 is (C1+N+R) //10,
N is (C2+E+O) mod 10,
C3 is (C2+E+O) //10,
O is (C3+S+M) mod 10,
C4 is (D+E) //10,
M is C4.
digit(0).
digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).

crypto([S,E,N,D,M,O,R,Y]):-select1(D,[0,1,2,3,4,5,6,7,8,9],R1),
select1(E,R1,R2),
Y is (D+E) mod 10,
C1 is (D+E) //10,
select1(N,R2,R3),
select1(R,R3,R4),
E is (N+R+C1) mod 10,
C2 is (N+R+C1) //10,
select1(O,R4,R5),
N is (E+O+C2) mod 10,
C3 is (E+O+C2) //10,
select1(S,R5,R6),
select1(M,R6,_),
O is (S+M+C3) mod 10,
C4 is (S+M+C3) //10,
M is C4.

select1(X,[X|T],T).
select1(X,[H|T],[H|Z]):-select1(X,T,Z).

range(A,A,[A]).
range(A,B,[A|L]):- A<B,A1 is A+1,range(A1,B,L).
