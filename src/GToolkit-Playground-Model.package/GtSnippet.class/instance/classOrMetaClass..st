accessing
classOrMetaClass: aBehavior
	self 
		assert: [ aBehavior notNil ] 
		description: [ 'Class or meta-class must be non-nil' ].
	classOrMetaClass := aBehavior