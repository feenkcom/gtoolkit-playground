accessing
context
	<return: #GtSnippetContext>
	^ self defaultContextClass new
		snippet: self snippet;
		tool: self