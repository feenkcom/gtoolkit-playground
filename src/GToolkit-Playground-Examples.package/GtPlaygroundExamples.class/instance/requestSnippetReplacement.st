model - updates
requestSnippetReplacement
	<gtExample>
	| aPage anAnnouncements aSnippet theSnippets |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	theSnippets := aPage snippets copy.
	aSnippet := aPage snippets first.
	aSnippet requestSnippetReplacement: GtCollectionSnippet.
	self assert: aPage snippets size equals: 2.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: aPage snippets first class equals: GtCollectionSnippet.
	self assert: aPage snippets second equals: theSnippets second.
	self assert: anAnnouncements size equals: 1.
	^ aPage