initialization
initialize
	super initialize.
	text := '' asRopedText.
	bindingsStrategy := GtHighlightingBindingStrategy new.
	classOrMetaClass := UndefinedObject.
	look := GtTextEditorLook.