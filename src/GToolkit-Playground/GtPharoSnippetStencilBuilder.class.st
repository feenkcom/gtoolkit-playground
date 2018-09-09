Class {
	#name : #GtPharoSnippetStencilBuilder,
	#superclass : #GtSnippetStencilBuilder,
	#category : 'GToolkit-Playground-Snippet - Stencils'
}

{ #category : #'api - instantiation' }
GtPharoSnippetStencilBuilder >> buildDefault [
	<return: #BlElement>

	^ super buildDefault
		look: GtSnippetContainerLook 
			+ GtPharoSnippetLook 
			+ BrLayoutLook linearVertical vFitContent hMatchParent
]
