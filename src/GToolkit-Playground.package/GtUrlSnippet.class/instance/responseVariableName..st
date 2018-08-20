accessing
responseVariableName: aStringOrSymbol
	responseVariableName := aStringOrSymbol asSymbol.
	self response ifNil: [ ^ self ].
	self variableBindings at: self responseVariableName put: self response.