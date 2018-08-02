model - updates
addSnippet
	<gtExample>
	| aPage anAnnouncements |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aPage addSnippet: (self pharoSnippet content: 'aValue').
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets third content asString equals: 'aValue'.
	self assert: anAnnouncements size equals: 1.
	^ aPage