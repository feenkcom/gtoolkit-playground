initialization
initializeLook
	super initializeLook.

 	self widget constraintsDo: [ :c |
		c padding: (BlInsets all: 5) ].

	context snippet: self snippet.
	context tool: self widget.

	self widget
		addChild: editor as: #textEditor;
		addChild: toolbar as: #toolBar