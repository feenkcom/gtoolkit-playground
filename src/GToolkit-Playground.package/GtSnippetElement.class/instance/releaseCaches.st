drawing cache
releaseCaches
	cachedSurface ifNotNil: #release.
	cachedSurface := nil