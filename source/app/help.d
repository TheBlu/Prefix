module app.help;

public string helpText = q"EOS
Usage: prefix "<expr>"
Example: 'prefix "* - 1 2 3"' returns -3 (infix (1-2)*3)

This program solves mathematical expressions in Polish/prefix notation.
Programmed in D, using Pegged for expression recognition.
Author: Tanel Tagaväli aka lablanu

Expressions must be inside quotes.
Operands and operators must be separated by spaces.
EOS";
