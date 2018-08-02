accessing
classOrMetaClass: aBehavior
	self 
		assert: [ aBehavior notNil ] 
		description: [ 'Bindings must be non-nil' ].
	classOrMetaClass := aBehavior