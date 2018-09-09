Class {
	#name : #GtDecoratedCommand,
	#superclass : #GtCommand,
	#instVars : [
		'command'
	],
	#category : 'GToolkit-Playground-Commands'
}

{ #category : #testing }
GtDecoratedCommand class >> isAbstract [
	^ self name = #GtDecoratedCommand 
]

{ #category : #accessing }
GtDecoratedCommand >> command [
	<return: #GtCommand>
	^ command
]

{ #category : #accessing }
GtDecoratedCommand >> command: aGtCommand [
	self 
		assert: [ aGtCommand notNil ] 
		description: [ 'Command to execute must be non-nil' ].
	command := aGtCommand
]

{ #category : #initialization }
GtDecoratedCommand >> initialize [
	super initialize.
	command := GtNullCommand uniqueInstance.
]
