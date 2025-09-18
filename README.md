# Even Number Checker in Prolog

This repository contains a simple Prolog predicate to check if a number is even.

## File Description

- `even_checker.pl`: Contains the `is_even/1` predicate that succeeds if the input number is even.

## Predicate

```prolog
is_even(X) :-
    X mod 2 =:= 0.
```

## Usage

To use this predicate, load the file in a Prolog interpreter and query:

```prolog
?- is_even(4).
true.

?- is_even(7).
false.
```

## Explanation

The predicate works by using the modulo operator (`mod`) to check if the remainder of dividing the number by 2 is zero. If the remainder is zero, the number is even.