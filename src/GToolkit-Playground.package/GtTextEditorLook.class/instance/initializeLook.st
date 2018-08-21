initialization
initializeLook
	super initializeLook.

	self widget
		background: Color white;
		border: (BlBorder paint: EditorBorderColor width: 1);
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal matchParent.	
			c padding: (BlInsets top: 10 left: 5 bottom: 10 right: 5 ) ]