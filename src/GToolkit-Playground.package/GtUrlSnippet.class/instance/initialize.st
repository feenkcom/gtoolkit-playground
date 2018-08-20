initialization
initialize
	super initialize.
	response := nil.
	responseVariableName := #aResponse.
	self variableBindings: GtPlaygroundBindings new.
