Class {
	#name : #GtPlaygroundCommand,
	#superclass : #BlCommand,
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #testing }
GtPlaygroundCommand class >> isAbstract [
	^ self name = #GtPlaygroundCommand
]
