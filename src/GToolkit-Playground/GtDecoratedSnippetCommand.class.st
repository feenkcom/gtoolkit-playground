Class {
	#name : #GtDecoratedSnippetCommand,
	#superclass : #GtSnippetCommand,
	#instVars : [
		'command'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #testing }
GtDecoratedSnippetCommand class >> isAbstract [
	^ self name = #GtDecoratedSnippetCommand 
]

{ #category : #accessing }
GtDecoratedSnippetCommand >> command [
	<return: #GtCommand>
	^ command
]

{ #category : #accessing }
GtDecoratedSnippetCommand >> command: aGtCommand [
	self 
		assert: [ aGtCommand notNil ] 
		description: [ 'Command to execute must be non-nil' ].
	command := aGtCommand
]

{ #category : #initialization }
GtDecoratedSnippetCommand >> initialize [
	super initialize.
	command := GtNullCommand uniqueInstance.
]

{ #category : #execution }
GtDecoratedSnippetCommand >> requestTermination [
	"Every command is responsible to terminate nicely"
	command requestTermination
]

{ #category : #accessing }
GtDecoratedSnippetCommand >> result [
	"Return a command execution result"
	<return: #Object>
	^ command result
]
