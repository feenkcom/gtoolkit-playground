Class {
	#name : #GtBindingStrategy,
	#superclass : #Object,
	#traits : 'GtAssertingTrait',
	#classTraits : 'GtAssertingTrait classTrait',
	#instVars : [
		'bindings'
	],
	#category : 'GToolkit-VariableBindings'
}

{ #category : #asserting }
GtBindingStrategy class >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans."
	
	self isAssertionEnabled
		ifTrue: [ (aBlock value == true) ifFalse: [ 
				AssertionFailure signal: aStringOrBlock value ] ]
]

{ #category : #'instance creation' }
GtBindingStrategy class >> bindings: aGtBindings [
	^ self new bindings: aGtBindings
]

{ #category : #converting }
GtBindingStrategy >> asDictionary [
	^ self bindings asDictionary
]

{ #category : #binding }
GtBindingStrategy >> bindingOf: aSymbol [
	<return: #LiteralVariable or: nil>
	| assocOrNil |
	self assert: [ aSymbol isSymbol ] description: [ 'Bindings should be referenced by a symbol' ].
	assocOrNil := bindings bindingOf: aSymbol.
	^ self treatBinding: assocOrNil of: aSymbol.
	
]

{ #category : #accessing }
GtBindingStrategy >> bindings [
	^ bindings
]

{ #category : #accessing }
GtBindingStrategy >> bindings: anObject [
	self assert: [ anObject notNil ] description: [ 'Bindings should be an object' ].
	bindings := anObject
]

{ #category : #'gt-extension' }
GtBindingStrategy >> gtBindingsFor: aView [
	<gtView>
	^ (self bindings respondsTo: #gtBindingsFor:)
		ifTrue: [ self bindings gtBindingsFor: aView ]
		ifFalse: [ aView empty ]
]

{ #category : #initialization }
GtBindingStrategy >> initialize [
	super initialize.
	self initializeBindings.
]

{ #category : #initialization }
GtBindingStrategy >> initializeBindings [
	bindings := GtNoBindings uniqueInstance.
]

{ #category : #private }
GtBindingStrategy >> treatBinding: anAssocOrNil of: aSymbol [
	"Subclasses can treat existing or missing bindings of a variable named aSymbol"
	<return: #LiteralVariable or: nil>
	^ anAssocOrNil
]