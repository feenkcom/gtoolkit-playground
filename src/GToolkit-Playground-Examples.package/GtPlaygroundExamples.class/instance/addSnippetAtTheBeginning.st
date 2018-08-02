model - updates
addSnippetAtTheBeginning
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet content: 'aValue'.
	aPage addSnippet: aSnippet at: 1.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets first equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage