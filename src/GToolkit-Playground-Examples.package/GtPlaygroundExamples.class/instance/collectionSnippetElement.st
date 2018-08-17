ui - model elements
collectionSnippetElement 
	<gtExample>
	| anElement |
	anElement := self collectionSnippet asElement.
	self assert: anElement childrenCount equals: 3.
	^ anElement