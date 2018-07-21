accessing
at: anIndex
	<return: #GtPage>
	self 
		assert: [ anIndex isInteger ] 
		description: [ 'Index has to be an integer' ].
	^ collection at: anIndex