initialization
initialize
	| aCompletionStrategy aCompletionController |
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.

	snippet := GtPharoSnippet new.

	toolbar := BrToolbar new.
	toolbar look: BrToolbarLook vertical.
	toolbar addItem: (BrButton new 
		look: BrMaterialToggleLabelledLook; 
		viewModel: (BrButtonModel new
			action: [ self snippet evaluate ];
			add: (BrLabelModel new text: 'Run'))).

	editorElement := BrEditorElement new.
	editorElement look: GtTextEditorLook.
	editorElement editor: snippet editor.
	aCompletionStrategy := GtPharoCompletionStrategy newForExpression.
	aCompletionStrategy classOrMetaClass: nil class.
	aCompletionController := GtCompletionController on: editorElement strategy: aCompletionStrategy.
	aCompletionController install.
