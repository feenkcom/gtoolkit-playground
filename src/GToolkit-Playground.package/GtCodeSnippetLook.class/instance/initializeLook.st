initialization
initializeLook
	super initializeLook.
	self widgetContent addChild: editorElement as: self constants editorElementName.
	self registerKeyBindings.