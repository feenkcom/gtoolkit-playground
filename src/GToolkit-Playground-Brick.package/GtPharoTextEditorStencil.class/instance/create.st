api - instantiation
create
	<return: #BrEditorElement>
	| anEditorElement anEditor aStyler |
	text attributes: { 
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler. 
		(BrFontSizeAttribute new size: 14) beNotOverwritableByStyler }.
	aStyler := BrRBTextStyler new.
	aStyler workspace: (GtHighlightingBindingStrategy new bindings: self bindings).
	aStyler classOrMetaClass: self classOrMetaClass.	
	anEditor := BrTextEditor new.
	anEditor styler: aStyler.
	anEditor text: text.
	anEditorElement := BrEditorElement new.
	anEditorElement editor: anEditor.
	anEditorElement look: look.
	^ anEditorElement