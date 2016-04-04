# prefix
`prefix` is a simple(4 basic operators) math expression solver written in D.
It uses [Pegged](https://github.com/PhilippeSigaud/Pegged) for parsing the notation.

## Usage
`prefix "<expr>"`
Example: `prefix "* - 1 2 3"` returns -3 (infix (1-2)*3)

This program solves mathematical expressions in Polish/prefix notation.
Programmed in D, using Pegged for expression parsing.

Expressions must be inside quotes.
Operands and operators must be separated by spaces.


There are no plans to add functionality, though requests are welcome.
