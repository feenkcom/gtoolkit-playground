initialization
newResultElement
	^ BlElement new
		addChild: self newResponseElement as: self constants responseElementName;
		addChild: self newVariableElement as: self constants variableElementName;
		look: BrLayoutLook linearHorizontal hMatchParent vFitContent;
		padding: self constants elementPaddingInsets.