initialization
newVariableElement
	variableElement := BrEditorElement new.
	variableElement look: BrGlamorousInputFieldLook.
	variableElement editor: (BrTextEditor new text: self snippet responseVariableName asRopedText).
	variableElement addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder key: Key return; build);
			action: [ :aShortcut | self assignNewVariableName ]).
	variableElement margin: (BlInsets top: 6 left: 5 bottom: 1 right: 0).
	^ variableElement