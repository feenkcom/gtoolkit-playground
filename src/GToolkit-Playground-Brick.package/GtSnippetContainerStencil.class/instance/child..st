accessing
child: aBlElement
	self 
		assert: [ aBlElement notNil ] 
		description: [ 'Child element must be non-nil' ].
	content := aBlElement asElement