initialization
initialize
	| aCompletionStrategy aCompletionController |
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.

	snippet := GtPharoSnippet new.

	"toolbar := BrToolbar new.
	toolbar look: BrToolbarLook vertical.
	toolbar addItem: (BrButton new 
		look: BrMaterialToggleLabelledLook; 
		viewModel: (BrButtonModel new
			action: [ self snippet evaluate ];
			add: (BrLabelModel new text: 'Run')))."

	editorElement := BrEditorElement new.
	editorElement look: GtTextEditorLook.
	editorElement editor: snippet editor.
	aCompletionStrategy := GtPharoCompletionStrategy newForExpression.
	aCompletionStrategy classOrMetaClass: nil class.
	aCompletionController := GtCompletionController on: editorElement strategy: aCompletionStrategy.
	aCompletionController install.
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