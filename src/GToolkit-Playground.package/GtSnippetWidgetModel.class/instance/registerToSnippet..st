announcement registration
registerToSnippet: aGtSnippet
	self widgetDo: [ :aWidget | 
		self unregisterFromSnippet: aGtSnippet.
		aGtSnippet
			when: GtSnippetEvaluatedAnnouncement
			do: [ :anAnnouncement | 
				anAnnouncement isSpawnResultRequested ifTrue: [ 
					self
						fireEvent:
							(GLMBlocObjectToSelect new
								toSelect: anAnnouncement result;
								fromElement: aWidget).
					self
						fireEvent:
							(GtPhlowObjectToSpawn new
								object: anAnnouncement result;
								sourceElement: aWidget) ] ]
			for: self ]