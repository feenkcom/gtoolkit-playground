example
modrianFileSnippetView
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (#GtFileSnippet new content: FileLocator workingDirectory fullPath).
	aPage addSnippet: (#GtMondrianSnippet new content: 'mondrian nodes with: files.
mondrian edges connectFrom: #parent.
mondrian layout tree nodeDistance: 1').
	^ aPage