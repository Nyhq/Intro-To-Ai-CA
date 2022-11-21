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
    
