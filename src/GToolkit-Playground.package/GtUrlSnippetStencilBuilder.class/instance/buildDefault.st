api - instantiation
buildDefault
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtUrlSnippetLook 
			+ BrLayoutLook linearVertical vFitContent hMatchParent