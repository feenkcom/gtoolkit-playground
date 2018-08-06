execution
prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	snippet := aToolContext snippet.
	self code: aToolContext sourceCode.
	self bindings: aToolContext variableBindings.