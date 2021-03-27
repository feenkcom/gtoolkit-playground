Class {
	#name : #GtPlayBookAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'tabGroup',
		'playBook'
	],
	#category : #'GToolkit-Playground-PlayBook - Look'
}

{ #category : #initialization }
GtPlayBookAptitude >> initialize [
	super initialize.

	playBook := GtPlayBook new.
	tabGroup := BrTabGroup new aptitude: BrGlamorousTabGroupAptitude.

	self updateTabs.
	self addChangeAddChildAs: #(pages) with: [ tabGroup ]
]

{ #category : #initialization }
GtPlayBookAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: GtPlayBookChanged do: [ :anEvent | self playBook: anEvent playBook ]
]

{ #category : #initialization }
GtPlayBookAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: GtPlayBookRequest new.
]

{ #category : #private }
GtPlayBookAptitude >> mayAddActionsFor: aGtPage in: aTab [
	| theActions |
	theActions := GtPhlowActionsCollector new
		fromObject: self playBook;
		selectUsing: [ :eachAction | eachAction target = GtPlaygroundActionTarget uniqueInstance ];
		collect.
	theActions ifEmpty: [ ^ self ].
	aTab toolbarStencil: [
		| aView |
		aView := GtPhlowView empty.
		aView addPhlowActions: theActions.
		aView actionsToolbarForElement: aTab ]
]

{ #category : #accessing }
GtPlayBookAptitude >> playBook [
	^ playBook
]

{ #category : #accessing }
GtPlayBookAptitude >> playBook: aGtPlayground [
	playBook := aGtPlayground.
	self updateTabs.
]

{ #category : #private }
GtPlayBookAptitude >> updateTab: aGtPage [
	| aTab |
	aTab := BrTab new
		aptitude: BrGlamorousTabAptitude;
		padding: (BlInsets all: 10);
		label: aGtPage title;
		stencil: [ aGtPage asElement ].
	self mayAddActionsFor: aGtPage in: aTab.
	tabGroup addTab: aTab
]

{ #category : #private }
GtPlayBookAptitude >> updateTabs [
	tabGroup viewModel tabs copy do: [ :eachTab | 
		tabGroup removeTab: eachTab widget ].
	self playBook pages do: [ :eachPage | 
		self updateTab: eachPage ]
]
