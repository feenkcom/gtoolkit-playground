building
buildDefault
	<return: #BlElement>
	| aMenu aVisitor |

	aMenu := CmdMenu activatedBy: self activationClass.
	aMenu buildInContext: self context.

	aVisitor := GtCommandToolbarRenderer new.
	aMenu gtAccept: aVisitor.
	aVisitor toolbar