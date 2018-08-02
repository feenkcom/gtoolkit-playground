accessing
look: aBrLook
	self 
		assert: [ aBrLook notNil ] 
		description: [ 'Brick look must be non-nil' ].
	look := aBrLook