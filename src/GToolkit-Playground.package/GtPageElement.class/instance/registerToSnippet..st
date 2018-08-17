private
registerToSnippet: eachSnippet
	^ eachSnippet
		when: GtSnippetEvaluatedAnnouncement
		do: [ :anAnnouncement | 
			anAnnouncement isSpawnResultRequested ifTrue: [ 
				self
					fireEvent:
						(GLMBlocObjectToSelect new
							toSelect: anAnnouncement result;
							fromElement: self).
				self
					fireEvent:
						(GtPhlowObjectToSpawn new
							object: anAnnouncement result;
							sourceElement: self) ] ]