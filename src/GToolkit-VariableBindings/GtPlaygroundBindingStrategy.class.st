Class {
	#name : #GtPlaygroundBindingStrategy,
	#superclass : #GtBindingStrategy,
	#category : #'GToolkit-VariableBindings-Core'
}

{ #category : #private }
GtPlaygroundBindingStrategy >> treatBinding: anAssocOrNil of: aSymbol [
	"Subclasses can treat existing or missing bindings of a variable named aSymbol"
	<return: #LiteralVariable or: nil>
	^ anAssocOrNil ifNil: [ 
		bindings at: aSymbol put: nil.
		bindings bindingOf: aSymbol ]
]
