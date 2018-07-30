initialization
initializeLook
	super initializeLook.

	self widgetDo: [ :anElement | 
		anElement 
			constraintsDo: [ :c | 
				c margin: (BlInsets all: 5).
				c padding: (BlInsets all: 5) ] ]