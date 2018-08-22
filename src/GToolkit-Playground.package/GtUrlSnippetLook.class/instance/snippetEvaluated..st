announcement handling
snippetEvaluated: aGtSnippetEvaluatedAnnouncement
	result := aGtSnippetEvaluatedAnnouncement result.
	aGtSnippetEvaluatedAnnouncement isException 
		ifTrue: [ self notifyUserAboutException: aGtSnippetEvaluatedAnnouncement ]
		ifFalse: [ self notifyUserAboutResult: aGtSnippetEvaluatedAnnouncement ].
	progressElement viewModel percentage: 100.
	progressElement removeFromParent.
	enterButton label: ('Press Enter to download again' asRopedText fontSize: 11).
	self ensureInfoElement.