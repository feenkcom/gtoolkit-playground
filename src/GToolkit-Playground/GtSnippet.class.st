Class {
	#name : #GtSnippet,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + TGtAnnouncer',
	#classTraits : 'GtAssertingTrait classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #testing }
GtSnippet class >> availableSnippetClasses [
	"Return snippet classes that can be used by users (visible to users)"
	^ self allSubclasses select: [ :eachClass | 
			eachClass isUserSnippet ]
]

{ #category : #testing }
GtSnippet class >> isAbstract [
	^ self name = #GtSnippet
]

{ #category : #testing }
GtSnippet class >> isUserSnippet [
	"Return true if a snippet class (type) should be used by users (visible to users)"
	^ self isAbstract not
]

{ #category : #accessing }
GtSnippet class >> typeName [
	<return: #String>
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	^ self subclassResponsibility
]

{ #category : #visitor }
GtSnippet >> accept: aVisitor [
	^ self subclassResponsibility
]

{ #category : #announcer }
GtSnippet >> announcer [
	<return: #Announcer>
	^ announcer
]

{ #category : #converting }
GtSnippet >> asElement [
	<return: #BlElement>
	^ self asStencilBuilder asElement
]

{ #category : #converting }
GtSnippet >> asStencilBuilder [
	"Return a stencil that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ self asStencilBuilder: self stencilBuilderClass
]

{ #category : #converting }
GtSnippet >> asStencilBuilder: aStencilBuilderClass [
	"Return a stencil that knows how to build snippet stencils"
	<return: #GtSnippetStencilBuilder>

	^ aStencilBuilderClass new snippet: self
]

{ #category : #'gt-extension' }
GtSnippet >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		stencil: self
]

{ #category : #initialization }
GtSnippet >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : #testing }
GtSnippet >> isUserSnippet [
	^ self class isUserSnippet
]

{ #category : #'api - modification' }
GtSnippet >> mergeWith: anSnippet [
	"Subclasses can define merging mechanism"
]

{ #category : #actions }
GtSnippet >> playAll [
	"Evaluate all request."
	^ nil
]

{ #category : #'api - requests' }
GtSnippet >> requestNewSnippetBelow [
	self announce: (GtSnippetBelowRequestedAnnouncement snippet: self).
]

{ #category : #'api - requests' }
GtSnippet >> requestSnippetFocus [
	self announce: (GtSnippetFocusRequestAnnouncement snippet: self).
]

{ #category : #'api - requests' }
GtSnippet >> requestSnippetRemoval [
	self announce: (GtSnippetRemovalRequestedAnnouncement snippet: self).
]

{ #category : #'api - requests' }
GtSnippet >> requestSnippetReplacement: aClass [
	self announce: (GtSnippetReplacementRequestedAnnouncement new
		snippet: self;
		requestedSnippetClass: aClass).
]

{ #category : #private }
GtSnippet >> snippetType [
	"Return a unique snippet item type per snippet class for the infinite list element.
	My subclasses may override me if they need a deeper customisation of element holder creation and binding logic"
	<return: #GtSnippetType>

	^ GtSnippetType of: self
]

{ #category : #converting }
GtSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ self subclassResponsibility
]

{ #category : #accessing }
GtSnippet >> text [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtSnippet >> typeName [
	<return: #String>
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	^ self class typeName
]

{ #category : #accessing }
GtSnippet >> variableBindings [
	^ GtNoBindings uniqueInstance
	
]

{ #category : #accessing }
GtSnippet >> variableBindings: aGtPlaygroundBindings [ 
	
]
