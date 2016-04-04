import pegged.grammar;

mixin(grammar(import("prefix.peg")));

real solve(ParseTree tree)
{
	import std.conv : to;
	import std.stdio : writeln;
	// Convert to Prefix.Number
	real result = 0;
	switch (tree.name)
	{
		case "Prefix.Number":

			// Convert matched string to integer
			result = to!real(tree.matches[0]);
			break;
		case "Prefix.Operand":

			// Solve Number or Operation
			result = solve(tree.children[0]);
			break;
		case "Prefix.Operation":

			// Get operation type
			auto opType = tree.children[0].children[0];

			// Get operand values
			auto op1 = solve(tree.children[1]);
			auto op2 = solve(tree.children[2]);

			// Do the appropriate operation
			switch (opType.name)
			{
				case "Prefix.Add":
					result = op1 + op2;
					break;
				case "Prefix.Subtract":
					result = op1 - op2;
					break;
				case "Prefix.Multiply":
					result = op1 * op2;
					break;
				case "Prefix.Divide":
					result = op1 / op2;
					break;
				default:
					break;
			}
			break;
		case "Prefix":
			result = solve(tree.children[0]);
			break;
		default:
			break;
	}
	return result;
}

void main(string[] args)
{
	import std.stdio : writeln;
	import std.array : join;

	string target = "";
	if (args.length == 1)
	{
		import app.help : helpText;
		writeln(helpText);
		return;
	}
	foreach (arg; args[1..$])
	{
		if (arg == "-h")
		{
			import app.help : helpText;
			writeln(helpText);
			return;
		}
	}

	if (args.length > 2)
	{
		import std.range : join;
		target = args[1..$].join();
	}
	else
	{
		target = args[1];
	}

	auto tree = Prefix(target);
	if (tree.successful)
	{
		writeln(solve(tree));
	}
	else
	{
		import app.help : helpText;
		writeln("Error: Expression is in unrecognized format.", "\n",
		        "Use spaces to separate operands.", "\n",
		        "\n", helpText, "\n",
		        "Parse log:", "\n",
		        tree);
	}
}
