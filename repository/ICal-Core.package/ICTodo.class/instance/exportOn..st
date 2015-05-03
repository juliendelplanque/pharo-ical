exporting
exportOn: anExporter
	super exportOn: anExporter.
	anExporter exportCompleted: self completed.
	anExporter exportPercentComplete: self percentComplete.
	anExporter exportDue: self due	
	