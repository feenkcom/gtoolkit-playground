drawing
drawBelowOnSpartaCanvas: aCanvas with: aSpan
	"I render background under text span"
	aSpan inspectOnce.
	aCanvas stroke
		paint: paint;
		path: (aSpan bounds" translateBy: aSpan baseline");
		strokeOptions: (aCanvas strokeOptions
			width: 1);
		draw