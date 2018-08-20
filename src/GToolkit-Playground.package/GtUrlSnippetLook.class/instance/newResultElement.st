initialization
newResultElement
	^ BlElement new
		addChild: self newResponseElement as: self constants responseElementName;
		addChild: (BlElement new look: BrLayoutLook linearHorizontal vFitContent hMatchParent) as: #flexibleSpace;
		addChild: self newVariableElement as: self constants variableElementName;
		look: BrLayoutLook linearHorizontal hMatchParent vFitContent;
		padding: self constants elementPaddingInsets.