initialization
initialize
	super initialize.
	editorElement := BrEditorElement new.
	editorElement look: GtTextEditorLook.
	self snippet: self defaultSnippet.