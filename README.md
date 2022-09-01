# Extut - Elixir Tutorial

This projects code is contained in a single defmodule of M.ex (see libs folder).

It is my typed code based on following the YouTube tutorial at:

https://youtu.be/pBNOavRoNL0

The code is not just a "tag-along" follow of the presenter (Derek Banas). I do take some liberties with the code (and will do a review over time and learning as I gain more knowledge).

## ELIXIR BNF-E LANG SPEC - FIRST ATTEMPT
I cannot find a BNF-E language specification for Elixir. So, I will scratch out what I know and see as I see it here. Perhaps this will turn into a formal document. Who knows.

### The "def <fn_name> do ... end" Construct

*Def_fn* **≜** **do** *Statements* **end**

*Statements* ≜ [*Assignment_expr* | *Expr*]

*Assignment_expr* ≜ [*Identifier* **=** *Expr*]

*Identifier* ≜ [{*a..z*|*A..Z*|*0..9*|*_*|*?*}]

## MISC NOTES

The ≜ (read as contains) is U+225C UTF-8 (Ctrl-Shift-u 225C on Linux keyboard)

## EXPIRIMENTAL
