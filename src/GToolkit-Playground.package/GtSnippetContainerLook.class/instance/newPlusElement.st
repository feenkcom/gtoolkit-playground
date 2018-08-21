instance creation
newPlusElement
	"Instantiate and return a new element playing a role of an arrow
	used to show / hide a preview"
	<return: #BlElement>
	| aRadius aThickness anIcon |

	aRadius := 5.
	aThickness := 1.
	anIcon := BlElement new
		size: (aRadius + aRadius) @ (aRadius + aRadius);
		geometry: (BlPolygon vertices: { 
			(aRadius - aThickness)@0 . (aRadius + aThickness)@0 . (aRadius + aThickness)@(aRadius - aThickness). (aRadius + aRadius)@(aRadius - aThickness). (aRadius + aRadius)@(aRadius + aThickness). (aRadius + aThickness)@(aRadius + aThickness). (aRadius + aThickness)@(aRadius + aRadius). (aRadius - aThickness)@(aRadius + aRadius). (aRadius - aThickness)@(aRadius + aThickness). 0@(aRadius + aThickness). 0@(aRadius - aThickness). (aRadius - aThickness)@(aRadius - aThickness)} );
		background: Color gray.

	^ BrButton new
		look: BrGlamorousButtonExteriorCircularLook + BrGlamorousButtonIconLook;
		size: 20@20;
		icon: anIcon;
		yourself