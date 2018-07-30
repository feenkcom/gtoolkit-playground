initialization
initializeLook
	super initializeLook.

	self widgetDo: [ :anElement | 
		anElement 
			constraintsDo: [ :c | 
				c vertical fitContent. 
				c horizontal matchParent.		
				c padding: (BlInsets all: 5) ] ]