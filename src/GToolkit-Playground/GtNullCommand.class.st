Class {
	#name : #GtNullCommand,
	#superclass : #GtCommand,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #cleanup }
GtNullCommand class >> cleanUp [
	self resetUniqueInstance
]

{ #category : #cleanup }
GtNullCommand class >> resetUniqueInstance [
	uniqueInstance := nil
]

{ #category : #accessing }
GtNullCommand class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #execution }
GtNullCommand >> execute [
	self error: 'You should define what to execute in advance'
]

{ #category : #execution }
GtNullCommand >> requestTermination [
	self error: 'You should define what to execute in advance'
]

{ #category : #accessing }
GtNullCommand >> result [
	"Return a command execution result"
	<return: #Object>
	^ nil
]
