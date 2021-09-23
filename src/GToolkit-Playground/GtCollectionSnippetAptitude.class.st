"
I am a look for a collection snippet. I provide a way to select the type of the snippet to create, for examples pharo code or url.

I am designed to work together with {{gtClass:GtSnippetWidgetModel}} and can be applied on the {{gtClass:GtSnippetElement}}

Example:
```
GtSnippetElement new
	look: GtCollectionSnippetLook + BrLayoutLook linearVertical vFitContent hMatchParent
```


"
Class {
	#name : #GtCollectionSnippetAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'snippet',
		'toolbar'
	],
	#category : #'GToolkit-Playground-Snippet - Looks'
}

{ #category : #adding }
GtCollectionSnippetAptitude >> addSnippet: aClass [ 
	self snippet requestSnippetReplacement: aClass
]

{ #category : #accessing }
GtCollectionSnippetAptitude >> availableSnippetClasses [
	^ self snippet availableSnippetClasses
]

{ #category : #initialization }
GtCollectionSnippetAptitude >> initialize [
	super initialize.

	toolbar := BrToolbar new
		hMatchParent;
		aptitude: BrGlamorousToolbarAptitude;
		background: (Color fromHexString: #f0f0f0);
		border: (BlBorder paint: Color veryLightGray width: 1);
		padding: (BlInsets all: 10).

	self addChangeAddChildAs: #(content toobar) with: [ toolbar ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self availableSnippetClasses
						do: [ :eachSnippetClass | 
							| anItem |
							anItem := BrButton new.
							anItem margin: (BlInsets all: 2).
							anItem
								aptitude: BrGlamorousButtonWithLabelAptitude.
							anItem label: eachSnippetClass new typeName.
							anItem action: [ self addSnippet: eachSnippetClass ].
							toolbar addItem: anItem ] ];
				down: [ :e |  ];
				yourself).
]

{ #category : #initialization }
GtCollectionSnippetAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ].
]

{ #category : #initialization }
GtCollectionSnippetAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : #accessing }
GtCollectionSnippetAptitude >> snippet [
	snippet ifNil: [ self snippet: GtCollectionSnippet new ].
	^ snippet
]

{ #category : #accessing }
GtCollectionSnippetAptitude >> snippet: aGtSnippet [
	snippet := aGtSnippet.
]
