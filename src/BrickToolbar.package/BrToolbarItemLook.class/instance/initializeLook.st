initialization
initializeLook
	super initializeLook.
	self widgetDo: [ 
		self widget constraintsDo: [ :c | 
			c padding: (BlInsets all: 3) ] ]