api - execution
executeSnippet: aGtSnippet
	"Return an execution result. It might be an exception object"
	<return: #Object>
	self
		assert: [ aGtSnippet notNil ] 
		description: [ 'Snippet must be non-nil' ].
	^ self new 
		snippet: aGtSnippet;
		execute;
		result