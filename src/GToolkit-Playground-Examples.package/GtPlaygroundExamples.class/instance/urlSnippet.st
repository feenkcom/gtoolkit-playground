model - snippets
urlSnippet
	<gtExample>
	<label: 'A basic URL snippet'>
	| aSnippet |
	aSnippet := GtUrlSnippet new.
	self assert: aSnippet url equals: 'https://feenk.com'.
	self assert: aSnippet typeName equals: 'url'.
	^ aSnippet