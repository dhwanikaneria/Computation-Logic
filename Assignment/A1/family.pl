%Assignment - 1
%Computatinal Logic
%Author :- Dhwaniben Kaaneria
%Net ID :- drk170130
%Family tree

male(tony).
male(bill).
male(abe).
male(john).
male(rob).
male(phil).
male(jack).
male(jim).
male(rick).

female(lisa).
female(sarah).
female(nancy).
female(mary).
female(jill).
female(kim).
female(susan).
female(ann).
female(martha).

mother(lisa,abe).
mother(lisa,sarah).
mother(nancy,john).
mother(sarah,susan).
mother(mary,jill).
mother(susan,jack).
mother(susan,phil).

father(tony,abe).
father(tony,sarah).
father(abe,john).
father(bill,susan).
father(rob,phil).
father(rob,jack).
father(john,jill).
father(jack,jim).

married(jill,rick).
married(kim,jack).
married(martha,jim).
married(ann,phil).

married(X,Y):-parent(X,A),parent(Y,A),not(X=Y).
%married(X,Y):-parent(X,A),parent(Y,A).

parent(X,Y):-father(X,Y),male(X).
parent(X,Y):-mother(X,Y),female(X).

sibling(X,Y):-parent(Z,X),parent(Z,Y),not(X=Y).

fcousin(X,Y):-parent(A,X),parent(B,Y),sibling(A,B).
scousin(X,Y):-parent(A,X),fcousin(A,Z),parent(Z,Y).

grnephew(X,Y):-male(X),gparent(Z,X),sibling(Z,Y).
gparent(X,Y):-parent(X,Z),parent(Z,Y).

niece(X,Y):-female(X),parent(Z,X),sibling(Z,Y).

anc(X,Y):-parent(X,Z),anc(Z,Y).
anc(X,Y):-parent(X,Y).

manc(X,Y):-anc(X,Y),male(X).

cousinofsame(X,Y):-fcousin(X,Y).
cousinofsame(X,Y):-parent(A,X),parent(B,Y),cousinofsame(A,B).

grnephew(X,Y):-male(X),(gparent(Z,A);gparent(Z,X)),(married(X,A);married(A,X)),(sibling(Z,B);sibling(Z,Y)),married(B,Y).

niece(X,Y):-female(X),(married(X,A);married(A,X)),(parent(Z,X);parent(Z,A)),(sibling(Z,Y);sibling(Z,B)),married(Y,B).

%niecek(X,Y):-(married(X,A);married(A,X)),(parent(Z,X);parent(Z,A)),married(Y,B),(sibling(Z,Y);sibling(Z,B)),female(X).

%samecousin(X,Y):-anc(Z,X),anc(Z,Y),not(sibling(X,Y)).

ancl(X,Y,s(A)):-parent(X,Z),ancl(Z,Y,A).
ancl(X,Y,0):-parent(X,Y).

samecousin(X,Y):-ancl(Z,X,A),ancl(Z,Y,B),not(sibling(X,Y)),(A=B).

