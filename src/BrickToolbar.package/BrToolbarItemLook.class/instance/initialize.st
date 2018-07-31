initialization
initialize
	super initialize.
	self add: (BrLayoutLook linearHorizontal
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ])