Class {
	#name : #GtPlayBookLook,
	#superclass : #BrLook,
	#instVars : [
		'tabGroup',
		'playBook'
	],
	#category : 'GToolkit-Playground-PlayBook - Look'
}

{ #category : #initialization }
GtPlayBookLook >> initialize [
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.
	playBook := GtPlayBook new.
	tabGroup := BrTabGroup new
		look: BrMaterialTabGroupLook;
		constraintsDo: [ :c | 
			c vertical matchParent. 
			c horizontal matchParent ].
	self updateTabs.
]

{ #category : #initialization }
GtPlayBookLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtPlayBookChanged do: [ :anEvent | self playBook: anEvent playBook ]
]

{ #category : #initialization }
GtPlayBookLook >> initializeLook [
	super initializeLook.
	self widget
		addChild: tabGroup as: #pages
]

{ #category : #initialization }
GtPlayBookLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtPlayBookRequest new.
]

{ #category : #accessing }
GtPlayBookLook >> playBook [
	^ playBook
]

{ #category : #accessing }
GtPlayBookLook >> playBook: aGtPlayground [
	playBook := aGtPlayground.
	self updateTabs.
]

{ #category : #private }
GtPlayBookLook >> updateTab: aGtPage [
	| aTab |
	aTab := BrTab new
				look: BrMaterialTabLabelledLook;
				padding: (BlInsets all: 10);
				label: aGtPage title;
				stencil: [ aGtPage asElement margin: (BlInsets all: 10) ]";
				actionsStencil: view actions".
	tabGroup addTab: aTab.
]

{ #category : #private }
GtPlayBookLook >> updateTabs [
	tabGroup viewModel tabs copy do: [ :eachTab | 
		tabGroup removeTab: eachTab widget ].
	self playBook pages do: [ :eachPage | 
		self updateTab: eachPage ]
]
