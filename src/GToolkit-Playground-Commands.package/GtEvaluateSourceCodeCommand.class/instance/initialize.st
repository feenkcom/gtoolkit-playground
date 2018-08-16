initialization
initialize
	super initialize.
	sourceCode := 'nil'.
	result := nil.
	isException := false.
	bindingsStrategy := GtPlaygroundBindingStrategy new.