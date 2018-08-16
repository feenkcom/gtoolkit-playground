actions
evaluateAndGoPharo
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
	| aSnippet aResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aVariable := 42'.
	aSnippet 
		when: GtSnippetEvaluatedAnnouncement 
		do: [ :anAnnouncement | theAnnouncements add: anAnnouncement ].
	aResult := aSnippet evaluateAndGo.
	self assert: aResult equals: 42.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first result equals: 42.
	self assert: theAnnouncements first isException not.
	self assert: theAnnouncements first isSpawnResultRequested.
	^ aSnippet