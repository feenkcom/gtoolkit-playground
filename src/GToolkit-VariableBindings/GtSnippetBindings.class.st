Class {
	#name : #GtSnippetBindings,
	#superclass : #Object,
	#traits : 'GtBindingsTrait + GtAssertingTrait',
	#classTraits : 'GtBindingsTrait classTrait + GtAssertingTrait classTrait',
	#instVars : [
		'bindings',
		'receiver'
	],
	#category : #'GToolkit-VariableBindings-Core'
}

{ #category : #converting }
GtSnippetBindings >> asDictionary [
	<return: #Dictionary>
	^ bindings copy
]

{ #category : #adding }
GtSnippetBindings >> at: aSymbol put: anObject [ 
	self assert: [ aSymbol isSymbol ] description: [ 'Variable name should be a symbol' ].
	bindings 
		at: aSymbol 
		put: ((WorkspaceVariable named: aSymbol) value: anObject)
]

{ #category : #binding }
GtSnippetBindings >> bindingOf: aSymbol [
	^ bindings
		at: aSymbol 
		ifPresent: [ :aValue | aValue ] 
		ifAbsent: [ nil ]
]

{ #category : #'gt-extension' }
GtSnippetBindings >> gtBindingsFor: aView [
	<gtView>
	^ bindings gtItemsFor: aView
]

{ #category : #binding }
GtSnippetBindings >> hasBindingOf: aSymbol [
	^ bindings includesKey: aSymbol
]

{ #category : #initialization }
GtSnippetBindings >> initialize [
	super initialize.
	bindings := Dictionary new.
	receiver := nil.
]

{ #category : #accessing }
GtSnippetBindings >> receiver [
	^ receiver
]

{ #category : #accessing }
GtSnippetBindings >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
GtSnippetBindings >> receiverClass [
	^ self receiver class
]
