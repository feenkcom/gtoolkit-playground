initialization
initializeLook
	";
		addChild: toolbar as: #toolBar"
	super initializeLook.
	self widget addChild: editorElement as: #textEditor.
	self attachCompletionController