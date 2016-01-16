/* Question 1 */
arc(a, b).
arc(b, c).
arc(b, d).
arc(c, f).
arc(d, f).
arc(c, e).
arc(f, e).

path(X, Z) :-
  arc(X, Z).
path(X, Z) :-
  arc(X, Y),
  path(Y, Z).

/* path(a, d), path(d, f). */
/* arc(X, Y), arc(Y, Z), arc(Z, f). */
/* path(X, X). */

/* Question 2 */
plus(0, 0, 0).
plus(0, Y, Y).
plus(X, Y, Z) :-
  s(X1) = X,
  s(Z1) = Z,
  plus(X1, Y, Z1).

trueOdd(s(0)).
trueOdd(X) :-
  X = s(s(X1)),
  trueOdd(X1).
  
odd(X) :-
  plus(s(0), Y, X),
  \+ odd(Y).
  
/* Question 3 */
ones_zeros([]).
ones_zeros([ 0 | T ]) :-
  ones_zeros(T).
ones_zeros([ 1 | T ]) :-
  ones_zeros(T).
  
/* Question 4 */
hasdups([ H | T ]) :-
  member(H, T),
  !.
hasdups([H | T ]) :-
  hasdups(T).

/* Question 5 */
prod(L, P) :-
  prodHelp(L, 1, P).

prodHelp([],Acc,Acc).
prodHelp([H|T], Acc, P) :-
  Acc1 is H*Acc,
  prodHelp(T, Acc1, P).

/* Question 6 */
containsTangential(List1, List2, N) :-
  containsHelp(List1, List2, 1, N).

containsHelp(List1, [], Index, Index).
containsHelp([H1|T1], [H2|T2], Index, N) :-
  (H1 = H2
   ->
     containsHelp(T1, T2, Index, N)
   ; 
     NextIndex is Index + 1,
     containsHelp(T1, [H2|T2], NextIndex, N)
  ).

containsP(List1, [], Index, Index).
containsP([H1|T1], [H2|T2], Index, N) :-
  H1 = H2,
  !,
  containsP(T1, T2, Index, N).
containsP([H1|T1], [H2|T2], Index, N) :-
  NextIndex is Index + 1,
  containsP(T1, [H2|T2], NextIndex, N).

contains(List1, List2, N) :-
  append(B, D, List1),
  append(A, List2, B),
  length(A, K),
  N is K + 1.
