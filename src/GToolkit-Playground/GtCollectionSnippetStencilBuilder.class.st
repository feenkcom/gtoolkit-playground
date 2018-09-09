Class {
	#name : #GtCollectionSnippetStencilBuilder,
	#superclass : #GtSnippetStencilBuilder,
	#category : 'GToolkit-Playground-Snippet - Stencils'
}

{ #category : #'api - instantiation' }
GtCollectionSnippetStencilBuilder >> buildDefault [
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtCollectionSnippetLook
			+ BrLayoutLook linearVertical vFitContent hMatchParent
]
