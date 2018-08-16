todo
modrianClassesView
	<gtExample>
	| aPage | 
	aPage := GtPageElement new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'classes := Collection withAllSubclasses.').
	aPage addSnippet: (GtPharoSnippet new sourceCode: 'view := GtMondrian new.
view nodes with: classes.
view edges connectFrom: #superclass.
view layout tree nodeDistance: 1.
view').
	^ aPage