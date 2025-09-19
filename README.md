# Prolog Even Number Checker

This repository contains a simple Prolog predicate to check if a number is even.

## File Description

- `even_check.pl`: Contains the `even/1` predicate that succeeds if the provided number is even.

## Usage

To use this predicate, you need to have SWI-Prolog installed. Then you can:

1. Load the file in the Prolog interpreter:
   ```
   swipl -f even_check.pl
   ```

2. Query the predicate:
   ```
   ?- even(4).
   true.
   
   ?- even(5).
   false.
   ```

## Predicate Definition

```prolog
even(N) :-
    N mod 2 =:= 0.
```

This predicate uses the modulo operator to check if a number is divisible by 2 with no remainder.