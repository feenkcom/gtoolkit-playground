accessing
variableBindings
	<return: #GtBindingsTrait>
	^ self snippet 
		ifNotNil: #bindings 
		ifNil: [ GtNoBindings uniqueInstance ]