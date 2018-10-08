Class {
	#name : #GtBindingExamples,
	#superclass : #Object,
	#category : #'GToolkit-VariableBindings-Examples'
}

{ #category : #'binding strategy' }
GtBindingExamples >> defaultHighlightingBindingStrategy [
	<gtExample>
	<label: 'Default highlighting binding strategy'>
	^ GtHighlightingBindingStrategy new
]

{ #category : #'binding strategy' }
GtBindingExamples >> defaultPlaygroundBindingStrategy [
	<gtExample>
	<label: 'Default playground binding strategy'>
	^ GtPlaygroundBindingStrategy new
]

{ #category : #'binding strategy' }
GtBindingExamples >> defaultSatisfyingHighlightingBindingStrategy [
	<gtExample>
	^ GtSatisfyingHighlightingBindingStrategy new
]

{ #category : #'binding strategy' }
GtBindingExamples >> highlightingBindingStrategy [
	<gtExample>
	<label: 'Initialized playground bindings'>
	^ self defaultHighlightingBindingStrategy
		bindings: self playgroundBindings
]

{ #category : #'bindings - object' }
GtBindingExamples >> objectBindings [
	<gtExample>
	<label: 'Default object bindings'>
	| aBindings |
	aBindings := GtObjectBindings new.
	self assert: aBindings receiver isNil.
	^ aBindings
]

{ #category : #'binding strategy' }
GtBindingExamples >> playgroundBindingStrategy [
	<gtExample>
	<label: 'Initialized playground bindings'>
	^ self defaultPlaygroundBindingStrategy
		bindings: self playgroundBindings
]

{ #category : #'bindings - playground' }
GtBindingExamples >> playgroundBindings [
	<gtExample>
	<label: 'Default playground bindings'>
	| aBindings |
	aBindings := GtPlaygroundBindings new.
	^ aBindings
]

{ #category : #'binding strategy' }
GtBindingExamples >> queryDefaultHighlightingBindingStrategy [
	<gtExample>
	<label: 'Query default highlighting binding strategy'>
	| strategy result |
	strategy := self defaultHighlightingBindingStrategy.
	result := strategy bindingOf: self variableOneName.
	self assert: result isNil.
	^ strategy
]

{ #category : #'binding strategy' }
GtBindingExamples >> queryDefaultPlaygroundBindingStrategy [
	<gtExample>
	<label: 'Query default playground binding strategy'>
	| strategy result |
	strategy := self defaultPlaygroundBindingStrategy.
	result := strategy bindingOf: self variableOneName.
	self assert: result isNil.
	^ strategy
]

{ #category : #'binding strategy' }
GtBindingExamples >> queryDefaultSatisfyingHighlightingBindingStrategy [
	<gtExample>
	| strategy result |
	strategy := self defaultSatisfyingHighlightingBindingStrategy.
	result := strategy bindingOf: self variableOneName.
	self assert: result notNil.
	self assert: result key equals: self variableOneName.
	self assert: result value equals: nil.
	^ strategy
]

{ #category : #'bindings - object' }
GtBindingExamples >> queryEmptyObjectBindings [
	<gtExample>
	<label: 'Query empty bindings'>
	| emptyBindings result |
	emptyBindings := self objectBindings.
	result := emptyBindings
		bindingOf: self variableOneName.
	self assert: result isNil.
	^ emptyBindings
]

{ #category : #'bindings - playground' }
GtBindingExamples >> queryEmptyPlaygroundBindings [
	<gtExample>
	<label: 'Query empty bindings'>
	| emptyBindings result |
	emptyBindings := self playgroundBindings.
	result := emptyBindings
		bindingOf: self variableOneName.
	self assert: result isNil.
	^ emptyBindings
]

{ #category : #'binding strategy' }
GtBindingExamples >> queryHighlightingBindingStrategy [
	<gtExample>
	<label: 'Query highlighting binding strategy'>
	| strategy result |
	strategy := self highlightingBindingStrategy.
	result := strategy bindingOf: self variableOneName.
	self assert: result isNil.
	^ strategy
]

{ #category : #'bindings - object' }
GtBindingExamples >> queryObjectBindingsWithReceiver [
	<gtExample>
	<label: 'Set receiver'>
	| bindings result |
	bindings := self objectBindings.
	bindings receiver: self setObjectBindingsReceiver.
	result := bindings bindingOf: #receiver.
	self assert: result notNil.
	self assert: result key equals: #receiver.
	self assert: result value equals: 42.
	^ bindings
]

{ #category : #'binding strategy' }
GtBindingExamples >> queryPlaygroundBindingStrategy [
	<gtExample>
	<label: 'Query playground binding strategy'>
	| strategy result |
	strategy := self playgroundBindingStrategy.
	result := strategy bindingOf: self variableOneName.
	self assert: result notNil.
	self assert: result key equals: self variableOneName.
	self assert: result value equals: nil.
	^ result
]

{ #category : #'bindings - object' }
GtBindingExamples >> setObjectBindings [
	<gtExample>
	<label: 'Set variable one'>
	| bindings result |
	bindings := self objectBindings.
	bindings at: self variableOneName put: 42.
	result := bindings
		bindingOf: self variableOneName.
	self assert: result notNil.
	self assert: result value equals: 42.
	self assert: result key equals: self variableOneName.
	^ bindings
]

{ #category : #'bindings - object' }
GtBindingExamples >> setObjectBindingsReceiver [
	<gtExample>
	<label: 'Set receiver'>
	| bindings |
	bindings := self objectBindings.
	bindings receiver: 42.
	self assert: bindings receiver equals: 42.
	self assert: bindings receiverClass equals: 42 class.
	^ bindings
]

{ #category : #'bindings - object' }
GtBindingExamples >> setObjectBindingsWithReceiver [
	<gtExample>
	| bindings result receiver |
	bindings := self queryObjectBindingsWithReceiver.
	receiver := self setObjectBindingsReceiver.
	bindings receiver: receiver.
	bindings at: #receiver put: 42.
	result := receiver receiver.
	self assert: result notNil.
	self assert: result equals: 42.
	^ bindings
]

{ #category : #'bindings - playground' }
GtBindingExamples >> setPlaygroundBindings [
	<gtExample>
	<label: 'Set variable one'>
	| bindings result |
	bindings := self playgroundBindings.
	bindings at: self variableOneName put: 42.
	result := bindings
		bindingOf: self variableOneName.
	self assert: result notNil.
	self assert: result value equals: 42.
	self assert: result key equals: self variableOneName.
	^ bindings
]

{ #category : #accessing }
GtBindingExamples >> variableOneName [
	<gtExample>
	<label: 'Variable one name'>
	^ #variableOne
]
