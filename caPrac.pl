student_number(C20424096).

%Dot product

dotproduct([], [], 0). %Passes 2 vectors & default result 0

dotproduct([A1|B1], [A2|B2], Result) :- Prod is A1 * A2, %Multiply A1 by A2 and assign it to product
  dotproduct(B1, B2, Remaining), %Repeat for B1 & B2 + and remaining parings
  Result is Prod + Remaining. %Result is equal to the sum of all product pairs

%Remove odd numbers

removeOdd([], []). %Passes list of numbers, empty list is the output
removeOdd([X|X2], [X|EvenX]) :- 0 is X mod 2, removeOdd(X2, EvenX). %In the case that X is even i.e. 0 is returned from X mod 2, add it to EvenX
removeOdd([X|X2], EvenX) :- 1 is X mod 2, removeOdd(X2, EvenX). %In the case that X is odd i.e. 1 is returned, dont add it to the new list
    
%Lab Test Exercises

%1

house_elf(dobby).
witch(hermione).
witch(’McGonagall’).
witch(rita_skeeter).
magic(X):- house_elf(X).
magic(X):- wizard(X).
magic(X):- witch(X).
 %? Works ig? Unsure what he wants.

 %2
 
 %Perscribed logic
   connected(1,2). 
   connected(3,4). 
   connected(5,6). 
   connected(7,8). 
   connected(9,10). 
   connected(12,13). 
   connected(13,14). 
   connected(15,16). 
   connected(17,18). 
   connected(19,20). 
   connected(4,1). 
   connected(6,3). 
   connected(4,7). 
   connected(6,11). 
   connected(14,9). 
   connected(11,15). 
   connected(16,12). 
   connected(14,17). 
   connected(16,19).

  isConnected(A,C) :- connected(A,C). %Takes the input of 2 vectors
  isConnected(A,C) :- connected(A,B), %A and C are presumed conncted if A and B && B and C are connected
                      isConnected(B,C).

%3

  %Perscribed Logic
  byCar(auckland,hamilton).
  byCar(hamilton,raglan).
  byCar(valmont,saarbruecken).
  byCar(valmont,metz).
  byTrain(metz,frankfurt).
  byTrain(saarbruecken,frankfurt).
  byTrain(metz,paris).
  byTrain(saarbruecken,paris).
  byPlane(frankfurt,bangkok).
  byPlane(frankfurt,singapore).
  byPlane(paris,losAngeles).
  byPlane(bangkok,auckland).
  byPlane(singapore,auckland).
  byPlane(losAngeles,auckland).

%Chains travel methods
  direct(A,C) :- byCar(A,C);
                byPlane(A,C);
                byTrain(A,C).

%Using ^ to travel from A - > C
travel(A,C) :- direct(A,C).

%You can travel From A to X given that X gets to C
 travel(A,C) :- direct(A,X),
               travel(X,C).

%Travel from A to C when you go from A to C by direct traveling to A to C
 travel(A, C, go(A, C)) :-
    direct(A,C).

%Travel from A to C, by going from A to X given that you travel direct from A to X and eventually travel from X to C when you go B
 travel(A,C, go(A,X,B)) :-
   direct(A,X),
    travel(X, C, B).


%Check which travel method
travel(A,C, byCar(A, C)) :-
byCar(A,C).

travel(A,C, byPlane(A, C)) :-
byPlane(A,C).

travel(A,C, byTrain(A, C)) :-
byTrain(A,C).


travel(A,C, byCar(A, X, B)) :-
byCar(A,X),
travel(X, C, B).

travel(A,C, byPlane(A, X, B)) :-
byPlane(A,X),
travel(X, C, B).

travel(A,C, byTrain( A, X, B)) :-
byTrain(A,X),
travel( X, C, B).

