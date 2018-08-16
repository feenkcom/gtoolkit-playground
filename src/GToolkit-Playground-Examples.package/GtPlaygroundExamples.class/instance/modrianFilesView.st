todo
modrianFilesView
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'files := FileLocation workingDirectory allChildren.').
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'view := GtMondrian new.
view nodes with: files.
view edges connectFrom: #parent.
view layout tree nodeDistance: 1.
view').
	^ aPage