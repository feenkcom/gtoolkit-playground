initialization
newVariableElement
	variableElement := BrEditorElement new.
	variableElement look: GtInputFieldLook.
	variableElement editor: (BrTextEditor new text: self snippet responseVariableName asRopedText).
	variableElement addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key return; build);
			action: [ :aShortcut | self assignNewVariableName ]).
	^ variableElement