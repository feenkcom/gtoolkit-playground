Class {
	#name : #GtPlayBookWidgetModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'playBook'
	],
	#category : 'GToolkit-Playground-PlayBook - Model'
}

{ #category : #initialization }
GtPlayBookWidgetModel >> initialize [
	super initialize.
	playBook := GtPlayBook new.
]

{ #category : #notifying }
GtPlayBookWidgetModel >> notifyPlayBookChanged [
	self dispatchEvent: (GtPlayBookChanged new playBook: self playBook)
]

{ #category : #hooks }
GtPlayBookWidgetModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self when: GtPlayBookRequest reply: [ GtPlayBookChanged new playBook: self playBook ]
]

{ #category : #accessing }
GtPlayBookWidgetModel >> playBook [
	<return: #GtPlayBook>
	^ playBook
]

{ #category : #accessing }
GtPlayBookWidgetModel >> playBook: aGtPlayBook [
	playBook := aGtPlayBook.
	self notifyPlayBookChanged.
]
