exporting
exportOn: anExporter
	super exportOn: anExporter.
	anExporter exportAttachments: self attachments.
	anExporter exportCategories: self categories.
	anExporter exportClassification: self classification.
	anExporter exportCreated: self created.
	anExporter exportExclusionDates: self exclusionDates.
	anExporter exportExclusionRules: self exclusionRules.
	anExporter exportStatus: self status.
	anExporter exportRecurrenceDates: self recurrenceDates.
	anExporter exportRecurrenceRules: self recurrenceRules.
	anExporter exportLastModified: self lastModified.
	anExporter exportSequenceNumber: self sequenceNumber.
	anExporter exportSummary: self summary