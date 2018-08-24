Class {
	#name : #GtSnippetContainerStencilBuilder,
	#superclass : #BrColumnedListCellStencilBuilder,
	#category : 'GToolkit-Playground-Obsolete'
}

{ #category : #'api - instantiation' }
GtSnippetContainerStencilBuilder >> buildDefault [
	<return: #BlElement>
	^ BlElement new
		look: GtSnippetContainerLook;
		addChild: self rowValue asElement
]
