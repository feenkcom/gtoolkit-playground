Class {
	#name : #GtPlayPage,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + GtAnnouncerTrait',
	#classTraits : 'GtAssertingTrait classTrait + GtAnnouncerTrait classTrait',
	#instVars : [
		'snippets',
		'bindings',
		'announcer',
		'title'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #'instance creation' }
GtPlayPage class >> forObject: anObject [
	| aPlayPage |
	aPlayPage := self newDefault.
	aPlayPage bindings receiver: anObject.
	^ aPlayPage
]

{ #category : #'instance creation' }
GtPlayPage class >> newDefault [
	"Open a new play book with one page and one default snippet"
	<return: #GtPlayPage>
	| aPage |
	aPage := self new.
	aPage addSnippet: aPage newDefaultSnippet.
	^ aPage
]

{ #category : #visitor }
GtPlayPage >> accept: aVisitor [
	^ aVisitor visitGtPlayPage: self
]

{ #category : #'api - modification' }
GtPlayPage >> addSnippet: aGtSnippet [ 
	"Add a playground snippet"
	self addSnippet: aGtSnippet at: self snippets size + 1.
]

{ #category : #'api - modification' }
GtPlayPage >> addSnippet: aGtSnippet at: anIndex [
	"Add a playground snippet"

	self
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	self
		assert: [ anIndex > 0 and: [ anIndex <= (self snippets size + 1) ] ]
		description: [ 'Insert index ' , anIndex asString , ' is out of bounds' ].
	self snippets add: aGtSnippet beforeIndex: anIndex.
	self attachToSnippet: aGtSnippet.
	self notifySnippetAdded: aGtSnippet at: anIndex.
	aGtSnippet requestSnippetFocus.
]

{ #category : #announcer }
GtPlayPage >> announcer [
	<return: #Announcer>
	^ announcer
]

{ #category : #converting }
GtPlayPage >> asElement [
	<return: #BlElement>
	^ GtPageElement new 
			look: GtPageLook;
			page: self
]

{ #category : #'announcement registration' }
GtPlayPage >> attachToSnippet: aGtSnippet [
	aGtSnippet variableBindings: self bindings.
	aGtSnippet
		subscribe: GtSnippetBelowRequestedAnnouncement
			send: #snippetBelowRequestedAnnouncement:
			to: self
			for: self;
		subscribe: GtSnippetRemovalRequestedAnnouncement
			send: #snippetRemovalRequestedAnnouncement:
			to: self
			for: self;
		subscribe: GtSnippetReplacementRequestedAnnouncement
			send: #snippetReplacementRequestedAnnouncement:
			to: self
			for: self;
		subscribe: GtSnippetMergeRequestedAnnouncement 
			send: #snippetMergeRequestedAnnouncement: 
			to: self 
			for: self;
		subscribe: GtPageSnippetChangedAnnouncement
			send: #snippetChangedAnnouncement:
			to: self
			for: self

]

{ #category : #accessing }
GtPlayPage >> bindings [
	<return: #GtBindingsTrait>
	^ bindings
]

{ #category : #accessing }
GtPlayPage >> bindings: aGtBindingsTrait [
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Bindings must be non-nil' ].
	bindings := aGtBindingsTrait
]

{ #category : #'announcement registration' }
GtPlayPage >> detachFromSnippet: aGtSnippet [
	aGtSnippet variableBindings: GtNoBindings uniqueInstance.
	aGtSnippet unsubscribe: self.
]

{ #category : #'gt-extension' }
GtPlayPage >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		stencil: [self asElement margin: (BlInsets all: 10)];
		priority: 10
]

{ #category : #initialization }
GtPlayPage >> initialize [
	super initialize.
	snippets := OrderedCollection new.
	bindings := GtObjectBindings new.
	announcer := Announcer new.
	title := 'Page'.
]

{ #category : #'instance creation' }
GtPlayPage >> newCollectionSnippet [
	^ GtCollectionSnippet new.
]

{ #category : #'instance creation' }
GtPlayPage >> newDefaultSnippet [
	^ GtPharoSnippet new.
]

{ #category : #notifying }
GtPlayPage >> notifySnippet: anOldGtSnippet replactedBy: aNewGtSnippet at: anIndex [
	self announce: (GtPageSnippetReplacedAnnoucement new 
		page: self; 
		snippet: aNewGtSnippet; 
		previousSnippet: anOldGtSnippet;
		index: anIndex)
]

{ #category : #notifying }
GtPlayPage >> notifySnippetAdded: aGtSnippet at: anIndex [
	self announce: (GtPageSnippetAddedAnnoucement new page: self; snippet: aGtSnippet; index: anIndex)
]

{ #category : #notifying }
GtPlayPage >> notifySnippetRemoved: aGtSnippet at: anIndex [
	self announce: (GtPageSnippetRemovedAnnoucement new page: self; snippet: aGtSnippet; index: anIndex)
]

{ #category : #accessing }
GtPlayPage >> numberOfSnippets [
	^ self snippets size
]

{ #category : #'api - modification' }
GtPlayPage >> removeSnippet: aGtSnippet [
	"Remove a playground snippet"

	| anIndex |
	self
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	anIndex := self snippets indexOf: aGtSnippet.
	self snippets removeAt: anIndex.
	self detachFromSnippet: aGtSnippet.
	self notifySnippetRemoved: aGtSnippet at: anIndex.
	"Ensure that PlayPage has always one snippet."
	self snippets isEmpty ifTrue: [ self addSnippet: self newCollectionSnippet ].

]

{ #category : #'api - modification' }
GtPlayPage >> replaceSnippet: anExistingGtSnippet by: aNewGtSnippet [
	"Replace a snippet by a new one"
	| anIndex |
	self 
		assert: [ anExistingGtSnippet notNil ]
		description: [ 'Existing snippet must be non-nil' ].
	self 
		assert: [ aNewGtSnippet notNil ]
		description: [ 'New snippet must be non-nil' ].
	anIndex := self snippets indexOf: anExistingGtSnippet.
	self snippets at: anIndex put: aNewGtSnippet.
	self detachFromSnippet: anExistingGtSnippet.
	self attachToSnippet: aNewGtSnippet.
	self notifySnippet: anExistingGtSnippet replactedBy: aNewGtSnippet at: anIndex.
]

{ #category : #accessing }
GtPlayPage >> snippetAt: anInteger [ 
	<return: #GtSnippet>
	^ self snippets at: anInteger
]

{ #category : #'announcement handling' }
GtPlayPage >> snippetBelowRequestedAnnouncement: aGtSnippetBelowRequestedAnnouncement [ 
	| anSnippet anIndex aNewSnippet |
	anSnippet := aGtSnippetBelowRequestedAnnouncement snippet.
	self
		assert: [ anSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	anIndex := self snippets indexOf: anSnippet.
	aNewSnippet := aGtSnippetBelowRequestedAnnouncement secondSnippet.
	aNewSnippet ifNil: [ aNewSnippet := self newCollectionSnippet ].
	self addSnippet: aNewSnippet at: anIndex + 1.
]

{ #category : #'announcement handling' }
GtPlayPage >> snippetChangedAnnouncement: aGtPageSnippetChangedAnnouncement [ 
	| anIndex |
	anIndex := self snippets indexOf: aGtPageSnippetChangedAnnouncement snippet.
	aGtPageSnippetChangedAnnouncement page: self.
	aGtPageSnippetChangedAnnouncement index: anIndex.
	self announce: aGtPageSnippetChangedAnnouncement.
]

{ #category : #'announcement handling' }
GtPlayPage >> snippetMergeRequestedAnnouncement: aGtSnippetMergeRequestedAnnouncement [ 
	| anSnippet anIndex anAboveSnippet |
	anSnippet := aGtSnippetMergeRequestedAnnouncement snippet.
	self
		assert: [ anSnippet notNil ] 
		description: [ 'Source snippet to merge must be non-nil' ].
	anIndex := self snippets indexOf: anSnippet.
	anIndex < 2 ifTrue: [ "ignore request" ^ self ].
	anAboveSnippet := self snippetAt: anIndex - 1.
	anAboveSnippet mergeWith: anSnippet.
]

{ #category : #'announcement handling' }
GtPlayPage >> snippetRemovalRequestedAnnouncement: aGtSnippetRemovalRequestedAnnouncement [ 
	| anSnippet |
	anSnippet := aGtSnippetRemovalRequestedAnnouncement snippet.
	self
		assert: [ anSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	self removeSnippet: anSnippet.
]

{ #category : #'announcement handling' }
GtPlayPage >> snippetReplacementRequestedAnnouncement: aGtSnippetReplacementRequestedAnnouncement [ 
	| anExistingSnippet aNewSnippetClass |
	anExistingSnippet := aGtSnippetReplacementRequestedAnnouncement snippet.
	aNewSnippetClass := aGtSnippetReplacementRequestedAnnouncement requestedSnippetClass.
	self
		assert: [ anExistingSnippet notNil ] 
		description: [ 'Source snippet for new snippet request must be non-nil' ].
	self
		assert: [ aNewSnippetClass notNil ] 
		description: [ 'New snippet class for new snippet request must be non-nil' ].
	self replaceSnippet: anExistingSnippet by: aNewSnippetClass new.
]

{ #category : #accessing }
GtPlayPage >> snippets [
	<return: #OrderedCollection>
	^ snippets
]

{ #category : #'api - modification' }
GtPlayPage >> snippets: aCollectionOfGtSnippets [
	"Add snippets"
	aCollectionOfGtSnippets do: [ :eachSnippet | 
		self addSnippet: eachSnippet ]
]

{ #category : #accessing }
GtPlayPage >> title [
	<return: #String>
	^ title
]

{ #category : #accessing }
GtPlayPage >> title: aString [
	title := aString
]
