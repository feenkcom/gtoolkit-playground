initialization
initializeLook
	super initializeLook.

	self widget
		background: Color white;
		border: (BlBorder paint: Color veryVeryLightGray width: 1);
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal fitContent.		
			c padding: (BlInsets top: 1 left: 3 bottom: 1 right: 3 ).
			c margin: (BlInsets top: 1 left: 3 bottom: 1 right: 0 ) ]