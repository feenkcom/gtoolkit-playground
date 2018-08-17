model - updates
requestSnippetBelow
	<gtExample>
	| aPage anAnnouncements aSnippet theSnippets |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	theSnippets := aPage snippets copy.
	aSnippet := aPage snippets first.
	aSnippet requestNewSnippetBelow.
	self assert: aPage snippets size equals: 3.
	self assert: aPage snippets first equals: theSnippets first.
	self assert: (theSnippets includes: aPage snippets second) not.
	self assert: aPage snippets third equals: theSnippets second.
	self assert: anAnnouncements size equals: 1.
	^ aPage