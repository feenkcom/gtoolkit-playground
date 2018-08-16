example
modrianFilesView
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new content: 'files := FileLocation workingDirectory allChildren.').
	aPage addSnippet: (GtPharoSnippet new content: 'view := GtMondrian new.
view nodes with: files.
view edges connectFrom: #parent.
view layout tree nodeDistance: 1.
view').
	^ aPage