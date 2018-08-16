initialization
initializeLook
	super initializeLook.
	self widget constraintsDo: [ :c | 
		c margin: (BlInsets all: 5).
		c padding: (BlInsets all: 5) ]