instance creation
newPlusElement
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
		margin: (BlInsets top: 3 right: 5 bottom: 3 left: 5);
		background: Color veryVeryLightGray;
		padding: (BlInsets all: aThickness);
		look: (BrMouseHoverLook new
			effect: (BlOverlayAboveEffect new paint: (Color black))) + BrMouseClickLook