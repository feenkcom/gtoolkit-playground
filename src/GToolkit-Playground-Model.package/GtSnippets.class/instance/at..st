accessing
at: anIndex
	self 
		assert: [ anIndex isInteger ] 
		description: [ 'Index has to be an integer' ].
	^ collection at: anIndex