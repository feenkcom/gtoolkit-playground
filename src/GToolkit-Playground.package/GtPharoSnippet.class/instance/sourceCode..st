accessing
sourceCode: aStringOrRope
	super sourceCode: aStringOrRope.
	editor text attributes: {
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler.
		(BrFontSizeAttribute size: 14) beNotOverwritableByStyler }.