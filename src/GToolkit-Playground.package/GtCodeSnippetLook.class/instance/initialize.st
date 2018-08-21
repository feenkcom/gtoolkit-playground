initialization
initialize
	super initialize.
	editorElement := BrEditorElement new.
	editorElement look: BrGlamorousTextAreaLook.
	self snippet: self defaultSnippet.