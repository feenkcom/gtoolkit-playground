initialization
initialize
	super initialize.
	editorElement background: Color transparent.
	progressElement := self newProgressElement.
	inEditorToolbar := self newInEditorToolbar.
	resultElement := self newResponseAndVariableElement.
