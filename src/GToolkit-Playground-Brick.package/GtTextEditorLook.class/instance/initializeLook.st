initialization
initializeLook
	super initializeLook.

	self widget
		background: Color white;
		constraintsDo: [ :c | 
			c vertical fitContent. 
			c horizontal matchParent.		
			c padding: (BlInsets all: 5).
			c minHeight: 40 ]