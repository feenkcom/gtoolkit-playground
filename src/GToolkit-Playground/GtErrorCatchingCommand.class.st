Class {
	#name : #GtErrorCatchingCommand,
	#superclass : #GtDecoratedCommand,
	#instVars : [
		'isException',
		'exception'
	],
	#category : 'GToolkit-Playground-Commands'
}

{ #category : #converting }
GtErrorCatchingCommand >> asErrorCatchingCommand [
	<return: #GtErrorCatchingCommand>
	^ self
]

{ #category : #accessing }
GtErrorCatchingCommand >> catchingErrors [
	^ command catchingErrors
]

{ #category : #accessing }
GtErrorCatchingCommand >> exception [
	<return: #Exception or: nil>
	^ exception
]

{ #category : #execution }
GtErrorCatchingCommand >> execute [
	[ 
		command execute.
		exception := nil.
	] on: self catchingErrors do: [ :anException |
		exception := anException.
	].
]

{ #category : #initialization }
GtErrorCatchingCommand >> initialize [
	super initialize.
	exception := nil.
]

{ #category : #testing }
GtErrorCatchingCommand >> isException [
	"Return true, if evaluation raised an exception"
	<return: #Boolean>
	^ self exception notNil
]

{ #category : #execution }
GtErrorCatchingCommand >> requestTermination [
	command requestTermination
]

{ #category : #accessing }
GtErrorCatchingCommand >> result [
	"Return a command execution result"
	<return: #Object>
	^ self isException 
		ifTrue: [ self exception ] 
		ifFalse: [ self command result ]
]
