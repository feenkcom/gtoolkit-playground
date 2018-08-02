factory
vertical
	^ self new add: (BrLayoutLook linearVertical fitContent
		constraintsDo: [ :c | 
			c padding: (BlInsets left: 3 right: 3).
			c margin: (BlInsets all: 5) ]).