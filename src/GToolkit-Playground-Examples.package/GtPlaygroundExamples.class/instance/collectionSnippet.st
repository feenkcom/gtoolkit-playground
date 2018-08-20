model - snippets
collectionSnippet
	<gtExample>
	<label: 'A Collection snippet'>
	| aSnippet |
	aSnippet := GtCollectionSnippet new.
	self assert: aSnippet availableSnippetClasses notEmpty.
	self assert: aSnippet typeName equals: 'collection'.
	^ aSnippet