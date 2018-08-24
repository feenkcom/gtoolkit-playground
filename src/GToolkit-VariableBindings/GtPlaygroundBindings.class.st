Class {
	#name : #GtPlaygroundBindings,
	#superclass : #Object,
	#traits : 'GtBindingsTrait + GtAssertingTrait',
	#classTraits : 'GtBindingsTrait classTrait + GtAssertingTrait classTrait',
	#instVars : [
		'bindings'
	],
	#category : 'GToolkit-VariableBindings'
}

{ #category : #converting }
GtPlaygroundBindings >> asDictionary [
	<return: #Dictionary>
	^ bindings copy
]

{ #category : #adding }
GtPlaygroundBindings >> at: aSymbol put: anObject [ 
	self assert: [ aSymbol isSymbol ] description: [ 'Variable name should be a symbol' ].
	bindings 
		at: aSymbol 
		put: ((WorkspaceVariable named: aSymbol) value: anObject)
]

{ #category : #binding }
GtPlaygroundBindings >> bindingOf: aSymbol [
	^ bindings
		at: aSymbol 
		ifPresent: [ :aValue | aValue ] 
		ifAbsent: [ nil ]
]

{ #category : #'gt-extension' }
GtPlaygroundBindings >> gtBindingsFor: aView [
	<gtView: 1>
	^ bindings gtItemsFor: aView
]

{ #category : #initialization }
GtPlaygroundBindings >> initialize [
	super initialize.
	bindings := Dictionary new.
]
