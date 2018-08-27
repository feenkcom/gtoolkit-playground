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
