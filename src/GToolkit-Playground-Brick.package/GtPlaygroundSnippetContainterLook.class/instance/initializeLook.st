initialization
initializeLook
	super initializeLook.

	self widgetDo: [ :anElement | 
		anElement 
			border: (BlBorder paint: Color gray width: 1);
			constraintsDo: [ :c | 
				c margin: (BlInsets all: 5).
				c padding: (BlInsets all: 5) ] ]