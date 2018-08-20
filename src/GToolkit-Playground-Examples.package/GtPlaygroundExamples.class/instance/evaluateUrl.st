actions
evaluateUrl
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
		| aSnippet aResult theAnnouncements |
	theAnnouncements := OrderedCollection new.
	aSnippet := self urlSnippet.
	aSnippet url: 'https://feenk.com'.
	aSnippet 
		when: GtSnippetEvaluatedAnnouncement 
		do: [ :anAnnouncement | theAnnouncements add: anAnnouncement ].
	aResult := aSnippet evaluate.
	self assert: aResult class equals: ZnResponse.
	self assert: theAnnouncements size equals: 1.
	self assert: theAnnouncements first result class equals: ZnResponse.
	self assert: theAnnouncements first isException not.
	self assert: theAnnouncements first isSpawnResultRequested not.
	^ aSnippet