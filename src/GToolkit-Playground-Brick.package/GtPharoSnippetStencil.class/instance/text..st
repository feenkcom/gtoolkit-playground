accessing
text: aBlRopedText
	self 
		assert: [ aBlRopedText notNil ] 
		description: [ 'Pharo snippet text should be initialized' ].
	text := aBlRopedText asRopedText