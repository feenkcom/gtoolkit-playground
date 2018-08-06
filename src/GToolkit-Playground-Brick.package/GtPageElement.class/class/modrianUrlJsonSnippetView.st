example
modrianUrlJsonSnippetView
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtUrlSnippet new content: (ZnEasy get: 'http://example.com/file.json')).
	aPage addSnippet: (#GtJsonSnippet new content: '''{"key":"value"}''').	
	aPage addSnippet: (#GtMondrianSnippet new content: 'mondrian nodes with: files.
mondrian edges connectFrom: #parent.
mondrian layout tree nodeDistance: 1').
	^ aPage