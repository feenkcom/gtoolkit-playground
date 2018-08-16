ui - model elements
pharoSnippetElementWithCode 
	<gtExample>
	| anElement |
	anElement := self pharoSnippetWithCode asElement.
	self assert: anElement childrenCount equals: 1.
	self assert: anElement children first class equals: BrEditorElement.
	self assert: anElement children first editor text asString equals: 'aValue := 42 + 7'.
	^ anElement