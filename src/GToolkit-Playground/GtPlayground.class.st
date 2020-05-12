Class {
	#name : #GtPlayground,
	#superclass : #BlElement,
	#traits : 'TGtPagerWindowOpener',
	#classTraits : 'TGtPagerWindowOpener classTrait',
	#instVars : [
		'book'
	],
	#category : #'GToolkit-Playground-UI'
}

{ #category : #'window creation' }
GtPlayground class >> create [
	^ self createOn: GtPlayBook newDefault.
]

{ #category : #'instance creation' }
GtPlayground class >> newOn: aPlayBook [
	"create a tool element on a given object"
	^ self new playBook: aPlayBook
]

{ #category : #'private - instance creation' }
GtPlayground class >> newTitleFrom: anObject [
	^ 'Playground'
]

{ #category : #'window creation' }
GtPlayground class >> open [
	^ self openOn: GtPlayBook newDefault.
]

{ #category : #'window creation' }
GtPlayground class >> openFrom: aSourceElement [
	^ self openOn: GtPlayBook newDefault from: aSourceElement.
]

{ #category : #initialization }
GtPlayground >> initialize [
	super initialize.
	self
		viewModel: GtPlayBookWidgetModel new;
		look: GtPlayBookLook;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ]
]

{ #category : #accessing }
GtPlayground >> playBook [
	^ self viewModel playBook
]

{ #category : #accessing }
GtPlayground >> playBook: aGtPlayBook [
	self viewModel playBook: aGtPlayBook
]
