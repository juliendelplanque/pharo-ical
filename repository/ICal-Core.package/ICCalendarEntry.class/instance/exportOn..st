exporting
exportOn: anExporter
	anExporter exportUid: self uid.
	anExporter exportUrl: self url.
	anExporter exportComments: self comments.
	anExporter exportStamp: self stamp