public access
evaluate
	| aCommand aFuture |
	aCommand := (GtUrlGetResponseCommand snippet: self) asErrorCatchingCommand.
	aFuture := aCommand future.
	aFuture onSuccessDo: [ :aResult |
		self 
			notifyAboutResult: aCommand result 
			exception: aCommand isException 
			spawn: false.
		response := aCommand result.
		self variableBindings at: self responseVariableName put: response ]