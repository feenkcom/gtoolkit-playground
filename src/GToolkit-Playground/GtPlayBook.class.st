Class {
	#name : #GtPlayBook,
	#superclass : #Object,
	#traits : 'GtAssertingTrait + TGtAnnouncer',
	#classTraits : 'GtAssertingTrait classTrait + TGtAnnouncer classTrait',
	#instVars : [
		'pages',
		'announcer'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtPlayBook class >> empty [
	^ self new
]

{ #category : #'instance creation' }
GtPlayBook class >> newDefault [
	"Open a new play book with one page and one default snippet"
	<return: #GtPlayBook>
	^ self new 
		addPlayPage: GtPlayPage newDefault;
		subscribeExternalTools
]

{ #category : #'instance creation' }
GtPlayBook class >> open [
	| aPlayground aSpace |

	aPlayground := self new asElement.
	aSpace := BlSpace new.
	aSpace title: 'Playground' translated.
	aSpace extent: 1200@600.
	aSpace root addChild: aPlayground.
	"aSpace root when: BlDblClickEvent do: [ :evt | BlElementSelection on: evt target ]."
	aSpace show.
	
	^ aPlayground
]

{ #category : #visitor }
GtPlayBook >> accept: aVisitor [
	^ aVisitor visitGtPlayBook: self
]

{ #category : #adding }
GtPlayBook >> addPlayPage: aGtPlayPage [
	self 
		assert: [ aGtPlayPage notNil ] 
		description: [ 'Play page must be non-nil' ].
	pages addLast: aGtPlayPage.
	self attachToPage: aGtPlayPage.
]

{ #category : #announcer }
GtPlayBook >> announcer [
	<return: #Announcer>
	^ announcer
]

{ #category : #converting }
GtPlayBook >> asElement [
	<return: #BlElement>
	^ BlElement new
		look: GtPlayBookLook + BrLayoutLook linearVertical matchParent;
		viewModel: (GtPlayBookWidgetModel new playBook: self)
]

{ #category : #subscriptions }
GtPlayBook >> attachToPage: aGtPlayPage [
	aGtPlayPage
		subscribe: GtPageAnnoucement
			send: #pageAnnouncement:
			to: self
			for: self

]

{ #category : #'gt-extension' }
GtPlayBook >> gtLiveFor: aView [
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		priority: 50;
		stencil: [ self asElement ]
]

{ #category : #initialization }
GtPlayBook >> initialize [
	super initialize.
	pages := OrderedCollection new.
	announcer := Announcer new.
]

{ #category : #accessing }
GtPlayBook >> numberOfPages [
	^ self pages size
]

{ #category : #'announcement handling' }
GtPlayBook >> pageAnnouncement: aGtPageAnnouncement [ 
	self announce: aGtPageAnnouncement.
]

{ #category : #accessing }
GtPlayBook >> pages [
	<return: #OrderedCollection>
	^ pages
]

{ #category : #adding }
GtPlayBook >> pages: aCollectionOfPages [
	aCollectionOfPages do: [ :eachPage | 
		self addPlayPage: eachPage ]
]

{ #category : #subscriptions }
GtPlayBook >> subscribeExternalTools [
	| thePragmas |
	thePragmas := Pragma 
		allNamed: #playBookHandler 
		from: self class
		to: ProtoObject.
	thePragmas do: [ :eachPragma | 
		self perform: eachPragma methodSelector ]
]
