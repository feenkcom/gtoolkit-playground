initialization
initializeLook
	super initializeLook.
	self widget
		background: (Color fromHexString: #'f0f0f0');
		border: (BlBorder paint: Color veryLightGray width: 1);
		constraintsDo: [ :c |
			c margin: (BlInsets top: 0 left: 0 bottom: 20 right: 5).
			c padding: (BlInsets all: 6) ].
	
	self widget addChild: contentElement as: #content.
	self widget addChild: bottomToolbar as: #bottomToolbar.
	self widget addChild: closeButton as: #closeButton.