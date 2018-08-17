initialization
initializeLook
	";
		addChild: toolbar as: #toolBar"
	super initializeLook.
	self widgetContent addChild: editorElement as: #textEditor.
	self attachCompletionController