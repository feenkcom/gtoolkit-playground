initialization
initialize
	| aToolbarBuilder aCompletionStrategy aCompletionController |
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.

	snippet := GtPharoSnippet new.
	context := GtPharoSnippetContext new.

	menu := CmdMenu activatedBy: GtPharoSnippetToolbarActivation.
	menu buildInContext: context.

	toolbar := BrToolbar new.
	toolbar look: BrToolbarLook vertical.

	aToolbarBuilder := GtCommandToolbarRenderer new.
	menu gtAccept: aToolbarBuilder.
	aToolbarBuilder items do: [ :aModel |
		toolbar addItem: (BrButton new look: BrMaterialToggleLabelledLook; viewModel: aModel) ].

	editorElement := BrEditorElement new.
	editorElement look: GtTextEditorLook.
	editorElement editor: snippet editor.
	aCompletionStrategy := GtPharoCompletionStrategy newForExpression.
	aCompletionStrategy classOrMetaClass: nil class.
	aCompletionController := GtCompletionController on: editorElement strategy: aCompletionStrategy.
	aCompletionController install.
