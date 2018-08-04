initialization
initializeLook
	super initializeLook.

	self widget
		background: Color white;
		border: (BlBorder paint: Color veryVeryLightGray width: 1);
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal matchParent.		
			c padding: (BlInsets all: 5) ]