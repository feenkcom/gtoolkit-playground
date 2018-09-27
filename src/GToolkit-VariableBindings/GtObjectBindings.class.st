Class {
	#name : #GtObjectBindings,
	#superclass : #Object,
	#traits : 'GtBindingsTrait + GtAssertingTrait',
	#classTraits : 'GtBindingsTrait classTrait + GtAssertingTrait classTrait',
	#instVars : [
		'bindings',
		'receiver'
	],
	#category : #'GToolkit-VariableBindings'
}

{ #category : #converting }
GtObjectBindings >> asDictionary [
	<return: #Dictionary>
	^ bindings asDictionary
]

{ #category : #adding }
GtObjectBindings >> at: aSymbol put: anObject [ 
	self assert: [ aSymbol isSymbol ] description: [ 'Variable name should be a symbol' ].
	(self receiver class allInstVarNamesEverywhere includes: aSymbol) 
		ifFalse: [ bindings at: aSymbol put: anObject ]
		ifTrue: [ self receiver instVarNamed: aSymbol put: anObject ]
	
]

{ #category : #binding }
GtObjectBindings >> bindingOf: aSymbol [
	<return: #LiteralVariable or: nil>
	^ (self receiver class allInstVarNamesEverywhere includes: aSymbol) 
			ifFalse: [ bindings bindingOf: aSymbol ]
			ifTrue: [ (WorkspaceVariable named: aSymbol) 
				value: (self receiver instVarNamed: aSymbol) ]
]

{ #category : #'gt-extension' }
GtObjectBindings >> gtBindingsFor: aView [
	<gtView>
	^ bindings gtBindingsFor: aView
]

{ #category : #initialization }
GtObjectBindings >> initialize [
	super initialize.
	bindings := GtPlaygroundBindings new.
	receiver := nil.
]

{ #category : #accessing }
GtObjectBindings >> receiver [
	"anObject is a receiver denominated by `self` in a source code."
	<return: #Object>
	^ receiver
]

{ #category : #accessing }
GtObjectBindings >> receiver: anObject [
	"anObject is a receiver denominated by `self` in a source code."
	^ receiver := anObject
]

{ #category : #accessing }
GtObjectBindings >> receiverClass [
	^ self receiver class
]
