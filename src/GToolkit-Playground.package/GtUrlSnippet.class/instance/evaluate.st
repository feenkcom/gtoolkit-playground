public access
evaluate
	| aCommand |
	aCommand := (GtUrlGetResponseCommand snippet: self) asErrorCatchingCommand.
	aCommand execute.
	self 
		notifyAboutResult: aCommand result 
		exception: aCommand isException 
		spawn: false.
	^ aCommand result