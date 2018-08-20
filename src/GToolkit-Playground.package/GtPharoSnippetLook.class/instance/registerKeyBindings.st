private
registerKeyBindings
	editorElement 
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key d; build);
			action: [ :aShortcut | self snippet evaluate ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key g; build);
			action: [ :aShortcut | self snippet evaluateAndGo ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key p; build);
			action: [ :aShortcut | self inform: self snippet evaluate printString ]).