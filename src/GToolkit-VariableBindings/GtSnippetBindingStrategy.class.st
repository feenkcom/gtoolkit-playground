Class {
	#name : #GtSnippetBindingStrategy,
	#superclass : #GtBindingStrategy,
	#category : #'GToolkit-VariableBindings-Core'
}

{ #category : #binding }
GtSnippetBindingStrategy >> bindingOf: aSymbol [
	<return: #LiteralVariable or: nil>
	(self isBindingInReceiverScope: aSymbol) ifTrue: [ 
		^ nil ].
	^ super bindingOf: aSymbol
	
]

{ #category : #testing }
GtSnippetBindingStrategy >> isBindingInReceiverScope: aSymbol [
	"If the requested binding is an instance variable of the receiver then return nil 
	and allow the instance scope to return the binding. This needs to happen as currenty
	the following scopes are searched: OCMethodScope -> OCRequestorScope  -> OCInstanceScope.
	If the requestor scope returns a variable that is present in the instance scope the value
	of that variable will be read/written from the binding and not from the instance."
	| receiverClass |
	receiverClass := bindings receiver class.
	^ receiverClass allInstVarNames includes: aSymbol

]

{ #category : #private }
GtSnippetBindingStrategy >> treatBinding: anAssocOrNil of: aSymbol [
	"Subclasses can treat existing or missing bindings of a variable named aSymbol"
	<return: #LiteralVariable or: nil>
	^ anAssocOrNil ifNil: [ 
		bindings at: aSymbol put: nil.
		bindings bindingOf: aSymbol ]
]
