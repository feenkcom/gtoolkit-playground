api - instantiation
buildDefault
	<return: #BlElement>

	| aContainer aContext |
	aContainer := BlElement new.
	aContainer look: GtPharoSnippetLook.
	aContainer debug: true.
	aContext := GtPharoSnippetContext new.
	aContext tool: aContainer.
	aContext snippet: self snippet.
	aContainer 
		addChild: ((GtPharoTextEditorStencil new 
				text: self snippet content;
				bindings: self snippet bindings; 
				classOrMetaClass: self snippet classOrMetaClass) asElement 
					debug: true;
					background: (Color lightBlue alpha: 0.2))
			as: #textEditor;
		addChild: ((BrToolbarCommanderBuilder new
				context: aContext;
				activationClass: GtPharoSnippetToolbarActivation;
				build) asElement 
					debug: true;
					background: (Color lightGreen alpha: 0.2))
			as: #toolBar.
	^ aContainer