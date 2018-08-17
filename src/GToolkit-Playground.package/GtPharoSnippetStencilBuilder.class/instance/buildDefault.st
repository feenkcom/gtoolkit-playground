api - instantiation
buildDefault
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtPharoSnippetLook 
			+ BrLayoutLook linearVertical vFitContent hMatchParent