accessing
sourceCode: aString
	self
		assert: [ aString notNil ] 
		description: [ 'Source code must be non-nil' ].
	sourceCode := aString asString