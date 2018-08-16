initialization
initializeLook
	super initializeLook.

	self widget
		addChild: editorElement as: #textEditor;
		addChild: toolbar as: #toolBar