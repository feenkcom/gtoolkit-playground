Class {
	#name : #GtPageStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'page'
	],
	#category : 'GToolkit-Playground-Obsolete'
}

{ #category : #accessing }
GtPageStencilBuilder >> availableSnippets [
	^ GtSnippet allSubclasses select: [ :eachClass | 
			eachClass isUserSnippet ]
]

{ #category : #'private - commands' }
GtPageStencilBuilder >> buildAddButtons [
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook horizontal.

	self availableSnippets do: [ :eachSnippetClass | 
		| aButton |
	
		aButton := BrButton new.
		aButton look: BrMaterialToggleLabelledLook.
		aButton label: eachSnippetClass new typeName.
		aButton action: [ self page addSnippet: eachSnippetClass new ].
			
		aToolbar addItem: aButton ].
	^ aToolbar
]

{ #category : #'api - instantiation' }
GtPageStencilBuilder >> buildDefault [
	<return: #BrStencil>
	^ BrSimpleList new 
		display: (self page snippets copyWith: self buildAddButtons);
		stencil: GtSnippetContainerStencilBuilder new.
]

{ #category : #initialization }
GtPageStencilBuilder >> initialize [
	super initialize.
	page := GtPlayPage new.
]

{ #category : #accessing }
GtPageStencilBuilder >> page [
	<return: #GtPlayPage>
	^ page
]

{ #category : #accessing }
GtPageStencilBuilder >> page: aGtPage [
	self 
		assert: [ aGtPage notNil ] 
		description: [ 'Playground page has to be initialized' ].
	page := aGtPage.
]
