actions
evaluateTwoPharoSnippets
	<gtExample>
	<label: 'Evaluate Pharo snippets'>
	| aPage aResult |
	aPage := self pageWithTwoDependingPharoSnippets.
	aResult := aPage snippets second evaluate.
	self assert: aResult class equals: MessageNotUnderstood.
	aResult := aPage snippets first evaluate.
	self assert: aResult equals: 42.
	aResult := aPage snippets second evaluate.
	self assert: aResult equals: 63.
	^ aPage