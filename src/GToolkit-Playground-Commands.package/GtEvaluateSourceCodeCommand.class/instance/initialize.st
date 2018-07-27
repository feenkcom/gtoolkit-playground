initialization
initialize
	super initialize.
	code := 'nil'.
	result := nil.
	isException := false.
	bindingsStrategy := GtPlaygroundBindingStrategy new.