initialization
initialize
	super initialize.
	client := nil.
	progressBlock := [ :aHTTPProgress | "do nothing" ].