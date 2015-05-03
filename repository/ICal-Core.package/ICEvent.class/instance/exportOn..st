exporting
exportOn: anExporter 
	super exportOn: anExporter.
	anExporter exportEnd: self end.
	anExporter exportTransparency: self transparency