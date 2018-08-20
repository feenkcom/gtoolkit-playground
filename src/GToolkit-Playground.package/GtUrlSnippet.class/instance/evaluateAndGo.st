public access
evaluateAndGo
	| aCommand |
	aCommand := (GtUrlGetResponseCommand snippet: self) asErrorCatchingCommand.
	aCommand execute.
	self 
		notifyAboutResult: aCommand result 
		exception: aCommand isException 
		spawn: true