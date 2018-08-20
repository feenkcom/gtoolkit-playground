api - actions
evaluateAndGo
	| aCommand |
	aCommand := (GtEvaluateSnippetCommand snippet: self) asErrorCatchingCommand.
	aCommand execute.
	self styleEvaluatedCodeWithResult: aCommand result.
	self 
		notifyAboutResult: aCommand result 
		exception: aCommand isException 
		spawn: true