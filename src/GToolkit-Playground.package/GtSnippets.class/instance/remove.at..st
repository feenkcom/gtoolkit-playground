api - adding / removing
remove: aGtSnippet at: anIndex
	"Remove a playground snippet"
	self 
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	self 
		assert: [ anIndex > 0 and: [ anIndex <= (self size + 1) ] ]
		description: [ 'Insert index ', anIndex asString, ' is out of bounds' ].
	collection removeAt: anIndex.