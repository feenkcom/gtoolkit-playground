initialization
initializeLook
	| anEditorElement |
	super initializeLook.
	anEditorElement := self widgetContent 
		childNamed: self constants editorElementName 
		ifFound: [ :theTextElement | theTextElement ]
		ifNone: [ self error: 'A text editor has to be attached before applying key bindings look' ].
	self registerKeyBindings: anEditorElement.