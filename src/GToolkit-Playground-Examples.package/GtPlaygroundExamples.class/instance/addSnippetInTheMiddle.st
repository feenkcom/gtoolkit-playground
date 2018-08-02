model - updates
addSnippetInTheMiddle
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := self pharoSnippet content: 'aValue'.
	aPage addSnippet: aSnippet at: 2.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets second equals: aSnippet.
	self assert: anAnnouncements size equals: 1.
	^ aPage