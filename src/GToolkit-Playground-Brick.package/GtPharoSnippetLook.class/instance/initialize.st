initialization
initialize
	| aToolbarBuilder |
	super initialize.
	self add: BrLayoutLook linearHorizontal hMatchParent vFitContent.

	snippet := GtPharoSnippet new.
	context := GtPharoSnippetContext new.

	menu := CmdMenu activatedBy: GtPharoSnippetToolbarActivation.
	menu buildInContext: context.

	toolbar := BrToolbar new.
	toolbar look: BrToolbarLook new.

	aToolbarBuilder := GtCommandToolbarRenderer new.
	menu gtAccept: aToolbarBuilder.
	aToolbarBuilder items do: [ :aModel |
		toolbar addItem: (BrButton new look: BrMaterialToggleLabelledLook; viewModel: aModel) ].

	editor := BrEditorElement new.
	editor look: GtTextEditorLook.
	editor editor: snippet editor