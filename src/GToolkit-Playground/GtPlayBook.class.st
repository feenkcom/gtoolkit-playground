Class {
	#name : #GtPlayBook,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#instVars : [
		'pages'
	],
	#category : 'GToolkit-Playground-Model'
}

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

{ #category : #adding }
GtPlayBook >> addPlayPage: aGtPlayPage [
	self 
		assert: [ aGtPlayPage notNil ] 
		description: [ 'Play page must be non-nil' ].
	pages addLast: aGtPlayPage
]

{ #category : #converting }
GtPlayBook >> asElement [
	<return: #BlElement>
	^ BlElement new
		look: GtPlayBookLook + BrLayoutLook linearVertical matchParent;
		viewModel: (GtPlayBookWidgetModel new playBook: self)
]

{ #category : #'gt-extension' }
GtPlayBook >> gtLiveFor: aView [
	<gtView: 1>
	^ aView explicit
		title: 'Live' translated;
		stencil: [ self asElement ]
]

{ #category : #initialization }
GtPlayBook >> initialize [
	super initialize.
	pages := OrderedCollection new.
	self addPlayPage: GtPlayPage new.
]

{ #category : #accessing }
GtPlayBook >> pages [
	<return: #OrderedCollection>
	^ pages
]
