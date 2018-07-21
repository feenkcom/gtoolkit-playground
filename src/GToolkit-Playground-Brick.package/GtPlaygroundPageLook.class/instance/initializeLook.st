initialization
initializeLook
	super initializeLook.

	self widgetDo: [ :anElement | 
		anElement constraintsDo: [ :c | 
			c vertical matchParent. 
			c horizontal matchParent. ] ]