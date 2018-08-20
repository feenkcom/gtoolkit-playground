notifying
notifyAboutResult: aResult exception: isExceptionBoolean spawn: wantsToSpawn
	self
		announce:
			(GtSnippetEvaluatedAnnouncement new
				snippet: self;
				result: aResult;
				isException: isExceptionBoolean;
				isSpawnResultRequested: wantsToSpawn)