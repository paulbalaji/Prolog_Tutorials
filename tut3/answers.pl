/* Question 1 */
all_members([], _).
all_members(X, Y) :-
  X = [H|T],
  member(H, Y),
  all_members(T, Y).

/* Question 2 */
pairs(X, Y) :-
  pairsH(X, [], Y).

pairsH([], Acc, Acc).
pairsH([H|T], Acc, Y) :-
  U is H - 1,
  V is H + 1,
  append(Acc, [(U, V)], Acc1),
  pairsH(T, Acc1, Y).

/* Question 3 */
arbpairs(X, Y) :-
  arbH(X, [], Y).

arbH([], Acc, Acc).
arbH([H|T], Acc, Y) :-
  append(Acc, [(H, H)], Acc1),
  arbH(T, Acc1, Y).
arbH([H|T], Acc, Y) :-
  H2 is H * 2,
  append(Acc, [(H, H2)], Acc1),
  arbH(T, Acc1, Y).

/* Question 4 */
replace_wrap(List, Res) :-
  rwH(List, [], Res).

rwH([], Acc, Acc).
rwH([H|T], Acc, Res) :-
  append(Acc, [wrap(H)], Acc1),
  rwH(T, Acc1, Res).

/* Question 5 */
even_members(X, Y) :-
  evenH(X, [], Y).

evenH([], Acc, Acc).
evenH([_], Acc, Acc).
evenH([_|T], Acc, Y) :-
  T = [SH|ST],
  append(Acc, [SH], Acc1),
  evenH(ST, Acc1, Y).

/* Question 6 */
odd_even_members(X, Y, Z) :-
  oeH(X, [], Y, [], Z).

oeH([], OddAcc, OddAcc, EvenAcc, EvenAcc).
oeH([Odd], OddAcc, Odds, EvenAcc, Evens) :-
  append(OddAcc, [Odd], OddAcc1),
  oeH([], OddAcc1, Odds, EvenAcc, Evens).
oeH([H|[H2|T]], OddAcc, Odds, EvenAcc, Evens) :-
  append(OddAcc, [H], OddAcc1),
  append(EvenAcc, [H2], EvenAcc1),
  oeH(T, OddAcc1, Odds, EvenAcc1, Evens).

/* Question 7 */
numval(N, V) :-
  number(N),
  !,
  V is N.
numval(a(X, Y), V) :-
  numval(X, A),
  numval(Y, B),
  V is A + B.
numval(m(X, Y), V) :-
  numval(X, A),
  numval(Y, B),
  V is A * B.
