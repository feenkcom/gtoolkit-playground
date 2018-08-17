initialization
initializeLook
	super initializeLook.
	self widget constraintsDo: [ :c | 
		c margin: (BlInsets all: 5).
		c padding: (BlInsets all: 5) ].
	self widget addChild: contentElement as: #content.
	self widget addChild: bottomToolbar as: #bottomToolbar.
	self widget addChild: closeButton as: #closeButton.