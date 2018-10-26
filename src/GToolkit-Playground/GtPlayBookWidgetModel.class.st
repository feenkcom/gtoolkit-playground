Class {
	#name : #GtPlayBookWidgetModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'playBook'
	],
	#category : #'GToolkit-Playground-PlayBook - Model'
}

{ #category : #'announcement handling' }
GtPlayBookWidgetModel >> handlePlayBookChangeRequestedAnnouncement: aGtPlayBookChangeRequestedAnnoucement [
	self playBook: aGtPlayBookChangeRequestedAnnoucement newPlayBook
]

{ #category : #initialization }
GtPlayBookWidgetModel >> initialize [
	super initialize.
	playBook := GtPlayBook new.
	self subscribeToPlayBook.
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
	self unsubscribeFromPlayBook.
	playBook := aGtPlayBook.
	self subscribeToPlayBook.
	self notifyPlayBookChanged.
]

{ #category : #subscriptions }
GtPlayBookWidgetModel >> subscribeToPlayBook [
	self playBook ifNil: [ ^ self ].
	self playBook 
		subscribe: GtPlayBookChangeRequestedAnnoucement 
		send: #handlePlayBookChangeRequestedAnnouncement:
		to: self
		for: self
]

{ #category : #subscriptions }
GtPlayBookWidgetModel >> unsubscribeFromPlayBook [
	self playBook unsubscribe: self.
]
