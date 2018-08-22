initialization
initialize
	super initialize.
	resultElement := self newResponseAndVariableElement.
	progressElement := self newProgressElement.
	enterButton := self newEnterButton.
	infoElement := self newHorizontalContainerElement 
			addChild: self newHorizontalFlexibleSpaceElement;
			addChild: enterButton