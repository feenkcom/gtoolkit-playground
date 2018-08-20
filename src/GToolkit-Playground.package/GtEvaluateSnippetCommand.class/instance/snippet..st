accessing
snippet: aGtSnippet
	super snippet: aGtSnippet.
	command requestor: aGtSnippet.
	command sourceCode: aGtSnippet sourceCode.
	command variableBindings: aGtSnippet variableBindings.