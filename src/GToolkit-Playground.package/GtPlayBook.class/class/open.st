instance creation
open
	| aPlayground aSpace |

	aPlayground := self new asElement.
	aSpace := BlSpace new.
	aSpace title: 'Playground' translated.
	aSpace extent: 1200@600.
	aSpace root addChild: aPlayground.
	"aSpace root when: BlDblClickEvent do: [ :evt | BlElementSelection on: evt target ]."
	aSpace show.
	
	^ aPlayground