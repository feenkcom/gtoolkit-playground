notifying
notifyEvaluated
	self snippet
		announce:
			(GtSnippetEvaluatedAnnouncement new
				snippet: self snippet;
				result: self result;
				isException: self isException;
				isSpawnResultRequested: self isSpawnResultRequested)