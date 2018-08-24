Class {
	#name : #GtCollectionSnippet,
	#superclass : #GtSnippet,
	#category : 'GToolkit-Playground-Model'
}

{ #category : #testing }
GtCollectionSnippet class >> isUserSnippet [
	^ false
]

{ #category : #accessing }
GtCollectionSnippet >> availableSnippetClasses [
	^ GtSnippet allSubclasses select: [ :eachClass | 
			eachClass isUserSnippet ]
]

{ #category : #converting }
GtCollectionSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ GtCollectionSnippetStencilBuilder
]

{ #category : #accessing }
GtCollectionSnippet >> typeName [
	<return: #String>
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	^ 'collection'
]
