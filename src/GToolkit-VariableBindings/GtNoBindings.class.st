Class {
	#name : #GtNoBindings,
	#superclass : #Object,
	#traits : 'GtBindingsTrait',
	#classTraits : 'GtBindingsTrait classTrait',
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'GToolkit-VariableBindings'
}

{ #category : #cleanup }
GtNoBindings class >> cleanUp [
	self reset.
]

{ #category : #accessing }
GtNoBindings class >> reset [
	uniqueInstance := nil
]

{ #category : #accessing }
GtNoBindings class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #converting }
GtNoBindings >> asDictionary [
	<return: #Dictionary>
	^ Dictionary new
]

{ #category : #adding }
GtNoBindings >> at: aString put: anObject [ 
	"ignore by default"
]

{ #category : #binding }
GtNoBindings >> bindingOf: aSymbol [
	^ nil
]
