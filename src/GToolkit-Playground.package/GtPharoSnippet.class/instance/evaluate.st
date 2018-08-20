as yet unclassified
evaluate
	| aCommand |
	aCommand := (GtNewEvaluateSnippetCommand snippet: self) asErrorCatchingCommand.
	aCommand execute.
	self 
		notifyAboutResult: aCommand result 
		exception: aCommand isException 
		spawn: false