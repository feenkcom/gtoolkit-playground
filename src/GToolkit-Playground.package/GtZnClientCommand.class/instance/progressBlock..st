accessing
progressBlock: anOneArgBlock
	self 
		assert: [ anOneArgBlock notNil ] 
		description: [ 'Progress block must be non-nil' ].
	progressBlock := anOneArgBlock