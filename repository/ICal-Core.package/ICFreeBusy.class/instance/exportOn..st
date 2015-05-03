exporting
exportOn: anExporter
	super exportOn: anExporter.
	anExporter exportStart: self start.
	anExporter exportEnd: self end.	
	anExporter exportDuration: self duration