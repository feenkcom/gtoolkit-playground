initialization
initialize
	super initialize.
	snippet := GtCollectionSnippet new.
	toolbar := BrToolbar new.
	toolbar look: BrToolbarLook horizontal.