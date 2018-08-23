initialization
initialize
	super initialize.
	editorElement background: Color transparent.
	progressElement := self newProgressElement.
	inEditorToolbar := self newInEditorToolbar.
	enterButton := self newEnterButton.
	infoElement := self newHorizontalContainerElement 
			addChild: self newHorizontalFlexibleSpaceElement;
			addChild: enterButton.
	resultElement := self newResponseAndVariableElement.
