card(X,Y):-suit(X),value(Y).
value(2,2).
value(3,3).
value(4,4).
value(5,5).
value(6,6).
value(7,7).
value(8,8).
value(9,9).
value(10,10).
value(jack,11).
value(queen,12).
value(king,13).
value(ace,14).
suit(clubs).
suit(spades).
suit(hearts).
suit(diamonds).
handrank([card(X,Y)|T],B):-suit(X),has_flush([card(X,Y)|T],0,A),B is A+2.

find_rank(Hand,Z):-has_flush(Hand,0,_),sort_hand(Hand,Sorted),has_straight(Sorted),Z is 9.
find_rank(Hand,Z):-sort_hand(Hand,Sorted),has_four_A_kind(Sorted,Z).
find_rank(Hand,Z):-sort_hand(Hand,Sorted),has_full_house(Sorted,Z).

find_rank(Hand,Z):-sort_hand(Hand,Sorted),has_straight(Sorted),Z is 6.
find_rank(Hand,Z):-has_flush(Hand,0,A),Z is A+1.
find_rank(Hand,Z):-sort_hand(Hand,Sorted),has_nopair(Sorted,Z).
find_rank(Hand,Z):-sort_hand(Hand,Sorted),has_one_pair(Sorted,Z).

better(Hand1,Hand2,Hand1):-rank(Hand1,H1),rank(Hand2,H2),H1>=H2,!.
better(Hand1,Hand2,Hand2):-rank(Hand1,H1),rank(Hand2,H2),H1<H2.


rank(Hand,Z):-sort_hand(Hand,Sorted),f_rank(Sorted,Z).

f_rank(Hand,Z):-has_flush(Hand,0,A),A is 4,has_straight(Hand),Z is 9.
f_rank([A,B,C,D,E],Z):-find_no_dup([A,B,C,D,E],Len),Len==2,(not(cvalue(D,E));not(cvalue(A,B))),Z is 8.

f_rank(Hand,Z):-find_no_dup(Hand,Len),((Len==5,has_flush(Hand,0,A),not(A==4),not(has_straight(Hand)),Z is 1);(Len==4,Z is 2);(Len==2,Z is 7)).
f_rank(Hand,Z):-has_straight(Hand),Z is 6.
f_rank(Hand,Z):-has_flush(Hand,0,A),Z is A+1.


f_rank([A,B,C,D,E],Z):-find_no_dup([A,B,C,D,E],Len),Len==3,((not(cvalue(A,C)),not(cvalue(B,D)),not(cvalue(C,E)),Z is 3);(((cvalue(A,C));(cvalue(B,D));(cvalue(C,E))),Z is 4)).

f_rank(Hand,Z):-find_no_dup(Hand,Len),((Len==5,Z is 1);(Len==4,Z is 2);(Len==2,Z is 7)).


find_no_dup(Hand,Len):-nodup(Hand,No_dupli),lengthI(No_dupli,Len).



has_no_pair(Hand,Z):-find_pair(Hand,L),((L==0,Z is 1);(L==1,Z is 2);(L==4,Z is 8);(L==7,Z is L)).

%has_one_pair(Hand,Z):-find_pair(Hand,L),L==1,Z is 2.

has_four_A_kind(Hand,Z):-find_pair(Hand,L),L==4,Z is 8.

%has_full_house(Hand,Z):-find_pair(Hand,L),Z is L.

%has_one_pair(Hand,Z):-find_pair(Hand,L),lengthL(L,Len),Len==2,Z is 3.


%find_pair([card(X,Y),card(X1,Y1)],Z):-value(Y,Yv),value(Y1,Y1v),Y1v==Yv,append(Y,[],Z).
%find_pair([card(X,Y),card(X1,Y1)],Z):-value(Y,Yv),value(Y1,Y1v),not(Y1v==Yv),append([],[],Z).
%find_pair([card(X,Y),card(X1,Y1)|T],L):-T=[_,_|_],find_pair([card(X1,Y1)|T],Z),value(Y,Yv),value(Y1,Y1v),Y1v==Yv,append(Y,Z,L).
%find_pair().
%find_pair([card(X,Y),card(X1,Y1)|T],L):-T=[_,_|_],find_pair([card(X1,Y1)|T],Z),value(Y,Yv),value(Y1,Y1v),not(Y1v==Yv),append([],Z,L).

find_pair(Hand,Z):-nodup(Hand,No_dupli),lengthI(No_dupli,Len),((Len==5,Z is 0);(Len==4,Z is 1);(Len==2,((cvalue(D,E),cvalue(A,B),(Z is 7));((not(cvalue(D,E));not(cvalue(A,B))),Z=4)))).
%find_pair(Hand,Z):-nodup(Hand,No_dupli),lengthI(No_dupli,Len),Len==4,Z is 1.
%find_pair(Hand,Z):-nodup(Hand,No_dupli),lengthI(No_dupli,Len),Len==2,Z is 7.

%find_pair([A,B,C,D,E],Z):-nodup([A,B,C,D,E],No_dupli),lengthI(No_dupli,Len),Len==2,(not(cvalue(D,E));not(cvalue(A,B))),Z=4.
cvalue(card(X,Y),card(X1,Y1)):-value(Y,Yv),value(Y1,Y1v),Yv==Y1v.


nodup([H|T],[H|Z]):-not(T==Z),nodup(T,Z),not(member(H,Z)).
nodup([H|T],Z):-not(T==Z),nodup(T,Z),(member(H,Z)).
nodup([],[]).

member(card(_,Y),[card(_,Y)|Xs]).
member(card(X,Yv),[Y|Ys]):-member(card(X,Yv),Ys).

lengthI([H|T],L):-lengthI([H|T],0,L).
lengthI([H|T],A,L):-A1 is A+1,lengthI(T,A1,L).
lengthI([],A,A).

append(Y,[],Y).
append(Y,[H|T],[H|Z]):-append(Y,T,Z).



has_straight([card(X,Y),card(X1,Y1)|T]):-value(Y,Yv),value(Y1,Y1v),Y1v is Yv+1,has_straight([card(X1,Y1)|T]).
has_straight([card(X,Y)]).


has_flush([card(X,Y),card(X1,Y1)],A,B):-X==X1,B is A+1.
has_flush([card(X,Y),card(X1,Y1)|T],A,R):-suit(X),X==X1,B is A+1,
has_flush([card(X1,Y1)|T],B,R).

sort_hand(Hand,Sorted):-sort_hand(Hand,[],Sorted).
sort_hand([],P,P).
sort_hand([H|T],P,R):-insert(H,P,S),sort_hand(T,S,R).

insert(H,[],[H]).
insert(card(X,Y),[card(X1,Y1)|T],[card(X,Y),card(X1,Y1)|T]):-value(Y,Yv),value(Y1,Y1v),Yv=<Y1v.
insert(card(X,Y),[card(X1,Y1)|T],[card(X1,Y1)|R]):-value(Y,Yv),value(Y1,Y1v),Yv>Y1v,insert(card(X,Y),T,R).

has_full_house(Hand,B):-has_full_house(Hand,0,B).
has_full_house([card(X,Y),card(X1,Y1)|T],A,B):-value(Y,Yv),value(Y1,Y1v),Yv==Y1v,A1 is A+1,has_full_house([card(X1,Y1)|T],A1,B).

has_full_house([card(X,Y),card(X1,Y1)|T],A,B):-value(Y,Yv),value(Y1,Y1v),
not(Yv==Y1v),has_full_house([card(X1,Y1)|T],0,B).
has_full_house([card(X,Y)],B,B).
has_full_house(hand,2,1).
has_full_house(hand,1,2).



