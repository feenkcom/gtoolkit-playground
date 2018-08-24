Class {
	#name : #GtPlayBookChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'playBook'
	],
	#category : 'GToolkit-Playground-PlayBook - Model'
}

{ #category : #accessing }
GtPlayBookChanged >> playBook [
	<return: #GtPlayBook>
	^ playBook
]

{ #category : #accessing }
GtPlayBookChanged >> playBook: aGtPlayground [
	playBook := aGtPlayground
]
