Class {
	#name : #GtCommand,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#category : 'GToolkit-Playground-Commands'
}

{ #category : #converting }
GtCommand >> asErrorCatchingCommand [
	<return: #GtErrorCatchingCommand>
	^ GtErrorCatchingCommand new command: self
]

{ #category : #taskit }
GtCommand >> asTask [
	^ TKTTask valuable: self
]

{ #category : #accessing }
GtCommand >> catchingErrors [
	"Return an error or collections of errors to catch during a command execution"
	^ Error
]

{ #category : #execution }
GtCommand >> execute [
	^ self subclassResponsibility
]

{ #category : #taskit }
GtCommand >> future [
	^ self asTask future
]

{ #category : #execution }
GtCommand >> requestTermination [
	"Every command is responsible to terminate nicely"
	self subclassResponsibility
]

{ #category : #accessing }
GtCommand >> result [
	"Return a command execution result"
	<return: #Object>
	^ self subclassResponsibility
]

{ #category : #taskit }
GtCommand >> value [
	^ self execute; result
]
