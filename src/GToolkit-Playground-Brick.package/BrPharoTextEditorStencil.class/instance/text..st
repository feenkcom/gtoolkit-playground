accessing
text: aBlRopedText
	self 
		assert: [ aBlRopedText notNil ] 
		description: [ 'Pharo source code must be non-nil' ].
	text := aBlRopedText asRopedText