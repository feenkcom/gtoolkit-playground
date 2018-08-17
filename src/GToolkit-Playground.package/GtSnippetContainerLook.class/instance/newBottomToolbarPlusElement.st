instance creation
newBottomToolbarPlusElement
	"Instantiate and return a new element playing a role of an arrow
	used to show / hide a preview"
	<return: #BlElement>

	| aRadius aThickness |
	aRadius := 5.
	aThickness := 2.
	
	^ BlElement new
		size: (aRadius + aRadius) @ (aRadius + aRadius);
		geometry: (BlPolygon vertices: { 
			(aRadius - aThickness)@0 . (aRadius + aThickness)@0 . (aRadius + aThickness)@(aRadius - aThickness). (aRadius + aRadius)@(aRadius - aThickness). (aRadius + aRadius)@(aRadius + aThickness). (aRadius + aThickness)@(aRadius + aThickness). (aRadius + aThickness)@(aRadius + aRadius). (aRadius - aThickness)@(aRadius + aRadius). (aRadius - aThickness)@(aRadius + aThickness). 0@(aRadius + aThickness). 0@(aRadius - aThickness). (aRadius - aThickness)@(aRadius - aThickness)} );
		margin: (BlInsets top: 5 right: 0 bottom: 5 left: 0);
		background: Color veryVeryLightGray;
		padding: (BlInsets all: aThickness);
		look: (BrMouseHoverLook new
			effect: (BlOverlayAboveEffect new paint: (Color black))) + BrMouseClickLook;
		viewModel: (BrButtonModel new action: [ self snippetBelowRequested ]) 