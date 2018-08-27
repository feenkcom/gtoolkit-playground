Trait {
	#name : #GtBindingsTrait,
	#category : 'GToolkit-VariableBindings'
}

{ #category : #adding }
GtBindingsTrait >> at: aSymbol put: anObject [ 
	"Set bindings for a variable named aSymbol and value anObject."
	self explicitRequirement
]

{ #category : #accessing }
GtBindingsTrait >> bindingOf: aSymbol [
	"aSymbol is a variable name.
	Return a literal variable if the variable has a value assigned.
	Return nil, if the variable has no value assigned."
	<return: #LiteralVariable or: nil>
	^ self explicitRequirement
]

{ #category : #accessing }
GtBindingsTrait >> receiver [
	"anObject is a receiver denominated by `self` in a source code."
	<return: #Object>
	^ nil
]

{ #category : #accessing }
GtBindingsTrait >> receiver: anObject [
	"anObject is a receiver denominated by `self` in a source code.
	Be default it is a nil without being able to define it.
	Concrete Trait implementations can change the behavior."
]

{ #category : #accessing }
GtBindingsTrait >> receiverClass [
	"A receiver is an object denominated by `self` in a source code.
	This method returns its class."
	<return: #ClassDescription>
	^ self receiver class
]
