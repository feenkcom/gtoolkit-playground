accessing
code: aString
	self
		assert: [ aString notNil ] 
		description: [ 'Source code must be non-nil' ].
	code := aString asString