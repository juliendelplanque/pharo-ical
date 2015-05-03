exporting
exportOn: anExporter
	anExporter exportTzid: self id.
	anExporter exportLastModified: self lastModified.
	anExporter exportTzurl: self url.
	self standardTimesDo: [ :each |
		anExporter export: each ].
	self daylightSavingTimesDo: [ :each |
		anExporter export: each ]