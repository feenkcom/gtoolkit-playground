drawing
drawBelowOnSpartaCanvas: aCanvas with: aSpan
	"I render background under text span"
	
	aCanvas stroke
		paint: self paint;
		path: (aCanvas shape line: (aSpan baseline + (2negated@4)) rounded to: (((aSpan width + aSpan baseline x) @ aSpan baseline y) + (2@4) ) rounded);
		width: 2;
		draw