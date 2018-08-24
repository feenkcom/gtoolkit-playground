initialization
initialize
	super initialize.
	client := nil.
	shouldContinue := true.
	progressBlock := [ :aHTTPProgress | "do nothing" ].