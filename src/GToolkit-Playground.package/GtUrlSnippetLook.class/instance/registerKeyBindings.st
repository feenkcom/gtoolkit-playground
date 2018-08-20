private
registerKeyBindings
	editorElement 
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key return; build);
			action: [ :aShortcut | self snippet evaluate ])