exporting
exportOn: anExporter
	anExporter exportStart: self start.
	anExporter exportRecurrenceRules: self recurrenceRules.
	anExporter exportRecurrenceDates: self recurrenceDates.
	anExporter exportOffsetFrom: self offsetFrom.
	anExporter exportOffsetTo: self offsetTo.
	anExporter exportComments: self comments.
	anExporter exportTimezoneNames: self names.