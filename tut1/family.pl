/*

    MAC, MCSs, MRes - 
    Module 531: Laboratory (Prolog)

    Comp 2: 276 Introduction to Prolog

    File: family.pl - cjh

*/

mother_of( M , X ) :-
  female( M ),
  child_of( X , M ).

grandparent_of( GP, X ) :-
  child_of( P , GP ),
  child_of( X , P ).
  
daughter_of( D , X ) :-
  child_of( D , X ),
  female( D ).
  
unc_or_aunt( Uncaunt , X ) :-
  grandparent_of( GP , X ),
  child_of( Uncaunt , GP ),
  \+child_of( X , Uncaunt ).
  
uncle_of( Uncle, X ) :-
  male( Uncle ),
  unc_or_aunt( Uncle , X ).
  
aunt_of( Aunt, X ) :-
  female( Aunt ),
  unc_or_aunt( Aunt , X).

niece_of( N , X ) :- 
  female( N ),
  unc_or_aunt( X , N ).
  
great_grandfather_of( Gfx, X ) :-
  male( Gfx ),
  child_of( X , P ),
  grandparent_of( Gfx, P).

sibling_of( X, Y ) :-
  child_of( X, Z ),
  child_of( Y, Z ),
  X \= Y.

sister_of( X, Y ) :-
  female( X ),
  sibling_of( X , Y ).
  
brother_of( X, Y ) :-
  male( X ),
  sibling_of( X , Y ).

ancestor_of( Anc , X ) :- 
  child_of( X , Anc).
ancestor_of( Anc, X ) :-
  child_of( X, P ),
  ancestor_of( Anc , P ).

/*
    Everything below was already written
*/

child_of( emmeline, frank ). 
child_of( amelia, frank ).
child_of( harold, frank ).
child_of( chris, amelia ).
child_of( chris, john ).
child_of( emlyn, chris ).
child_of( emlyn, elizabeth ).
child_of( brendon, chris ).
child_of( brendon, elizabeth ). 
child_of( irene, maurice ).
child_of( les, maurice ).
child_of( elizabeth, irene ).
child_of( elizabeth, george ).
child_of( margaret, irene ).
child_of( margaret, george ).
child_of( rebecca, margaret ).
child_of( louise, margaret ).   
child_of( nick, margaret ).
child_of( rebecca, peter ).
child_of( louise, peter ).
child_of( nick, peter ).

male( frank ).   
male( harold ).
male( chris ).
male( john ).
male( emlyn ).
male( brendon ).
male( maurice ).
male( les ).
male( nick ).
male( peter ).
male( george ).

female( emmeline ).
female( amelia ).
female( elizabeth ).
female( irene ).
female( margaret ).
female( rebecca ).
female( louise ).

% end of data
