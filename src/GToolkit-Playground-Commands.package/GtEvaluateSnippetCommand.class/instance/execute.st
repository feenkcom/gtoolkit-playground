execution
execute
	super execute.
	self snippet announce: (GtSnippetEvaluatedAnnouncement new
		snippet: self snippet;
		result: self result;
		isException: self isException)