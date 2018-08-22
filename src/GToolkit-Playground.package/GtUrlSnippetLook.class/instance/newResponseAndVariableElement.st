initialization
newResponseAndVariableElement
	^ self newHorizontalContainerElement
		margin: (BlInsets top: 3 left: 0 bottom: 0 right: 0);
		addChild: self newResponseElement
			as: self constants responseElementName;
		addChild: self newHorizontalFlexibleSpaceElement;
		addChild: self newVariableElement
			as: self constants variableElementName