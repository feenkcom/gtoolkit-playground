api - instantiation
create
	<return: #BrEditorElement>

	^ BrEditorElement new 
		editor: (BrTextEditor new text: self snippet contents asRopedText);
		look: GtPharoSnippetLook.