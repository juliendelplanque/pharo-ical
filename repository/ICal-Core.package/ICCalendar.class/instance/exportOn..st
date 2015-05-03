exporting
exportOn: anExporter
	anExporter exportProductId: self productId.
	anExporter exportVersion: self version.
	anExporter exportCalendarName: self name.
	anExporter exportMethod: self method.
	self componentsDo: [ :each |
		anExporter export: each ]