gt-extension
gtBindingsFor: aView
	<gtView: 1>
	^ (self bindings respondsTo: #gtBindingsFor:)
		ifTrue: [ self bindings gtBindingsFor: aView ]
		ifFalse: [ aView empty ]