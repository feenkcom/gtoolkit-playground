initialization
initializeLook
	super initializeLook.

	context snippet: self snippet.
	context tool: self widget.

	self widget
		addChild: editor as: #textEditor;
		addChild: toolbar as: #toolBar