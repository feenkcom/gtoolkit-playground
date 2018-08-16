model - updates
addSnippet
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet sourceCode: 'aValue'.
	aPage addSnippet: aSnippet.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets third equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage