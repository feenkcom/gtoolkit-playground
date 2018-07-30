execution
prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	self code: aToolContext sourceCode.
	self bindings: aToolContext variableBindings.