parent(mallikarjun, charan). parent(mallikarjun, pavani).
parent(charan, kalyan). parent(pavani, adithya).
male(mallikarjun). male(charan). male(kalyan). male(adithya).
female(pavani).
father(F,C):- parent(F,C),male(F).
mother(M,C):- parent(M,C),female(M).
write('F=mallikarjuna').
write('M=pavani').
write('c=charan').
sibling(A,B):- parent(P,A), parent(P,B), A\=B.