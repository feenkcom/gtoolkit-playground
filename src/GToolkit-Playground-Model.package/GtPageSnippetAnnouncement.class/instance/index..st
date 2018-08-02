accessing
index: anIndex
	self 
		assert: [ anIndex notNil ] 
		description: [ 'Snippet index must be non-nil' ].
	index := anIndex