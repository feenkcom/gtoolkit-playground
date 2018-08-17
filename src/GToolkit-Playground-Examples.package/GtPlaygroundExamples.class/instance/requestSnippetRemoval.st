model - updates
requestSnippetRemoval
	<gtExample>
	| aPage anAnnouncements aSnippet |
	aPage := self pageWithTwoPharoSnippets.
	anAnnouncements := OrderedCollection new.
	aPage when: Announcement do: [ :anAnnouncement | anAnnouncements add: anAnnouncement ].
	aSnippet := aPage snippets first.
	aSnippet requestSnippetRemoval.
	self assert: aPage snippets size equals: 1.
	self assert: (aPage snippets first = aSnippet) not.
	self assert: anAnnouncements size equals: 1.
	^ aPage