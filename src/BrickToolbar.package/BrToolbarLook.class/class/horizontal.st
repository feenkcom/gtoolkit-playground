factory
horizontal
	^ self new add: (BrLayoutLook linearHorizontal fitContent
		constraintsDo: [ :c | 
			c padding: (BlInsets top: 3 bottom: 3).
			c margin: (BlInsets all: 5) ]).