private
spawnResponse
	self widgetDo: [ :aWidget | 
		aWidget fireEvent: (GtPhlowObjectToSpawn new
				object: result;
				sourceElement: aWidget) ]