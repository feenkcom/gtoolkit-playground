example
modrianClassesView
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addSnippet: (GtPharoSnippet new content: 'classes := Collection withAllSubclasses.').
	aPage addSnippet: (GtPharoSnippet new content: 'view := GtMondrian new.
view nodes with: classes.
view edges connectFrom: #superclass.
view layout tree nodeDistance: 1.
view').
	^ aPage