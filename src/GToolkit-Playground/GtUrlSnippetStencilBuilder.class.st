Class {
	#name : #GtUrlSnippetStencilBuilder,
	#superclass : #GtSnippetStencilBuilder,
	#category : #'GToolkit-Playground-Snippet - Stencils'
}

{ #category : #'api - instantiation' }
GtUrlSnippetStencilBuilder >> buildDefault [
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtUrlSnippetLook 
			+ BrLayoutLook linearVertical vFitContent hMatchParent
]
