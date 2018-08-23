initialization
initialize
	super initialize.
	editorElement background: Color transparent.
	progressElement := self newProgressElement.
	enterButton := self newEnterButton.
	infoElement := self newHorizontalContainerElement 
			addChild: self newHorizontalFlexibleSpaceElement;
			addChild: enterButton.
	resultElement := self newResponseAndVariableElement.
