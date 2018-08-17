api - instantiation
buildDefault
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtCollectionSnippetLook
			+ BrLayoutLook linearVertical vFitContent hMatchParent