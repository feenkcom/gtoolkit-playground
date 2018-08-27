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
	^ bindings copy
]

{ #category : #adding }
GtObjectBindings >> at: aSymbol put: anObject [ 
	self assert: [ aSymbol isSymbol ] description: [ 'Variable name should be a symbol' ].
	bindings 
		at: aSymbol 
		put: ((WorkspaceVariable named: aSymbol) value: anObject)
]

{ #category : #binding }
GtObjectBindings >> bindingOf: aSymbol [
	^ bindings
		at: aSymbol 
		ifPresent: [ :aValue | aValue ] 
		ifAbsent: [ nil ]
]

{ #category : #'gt-extension' }
GtObjectBindings >> gtBindingsFor: aView [
	<gtView>
	^ bindings gtItemsFor: aView
]

{ #category : #initialization }
GtObjectBindings >> initialize [
	super initialize.
	bindings := Dictionary new.
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
