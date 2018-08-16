api - adding / removing
insert: aGtSnippet at: anIndex
	"Add a playground snippet"
	self 
		assert: [ aGtSnippet notNil ]
		description: [ 'Snippet must be non-nil' ].
	self 
		assert: [ anIndex > 0 and: [ anIndex <= (self size + 1) ] ]
		description: [ 'Insert index ', anIndex asString, ' is out of bounds' ].
	collection add: aGtSnippet beforeIndex: anIndex.