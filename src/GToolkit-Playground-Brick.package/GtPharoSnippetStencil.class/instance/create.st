api - instantiation
create
	<return: #BrEditorElement>

	^ BrEditorElement new 
		editor: (BrTextEditor new text: self text);
		look: GtPharoSnippetLook.