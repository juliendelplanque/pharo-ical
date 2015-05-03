exporting
exportOn: anExporter	
	anExporter exportAction: self action.
	anExporter exportTrigger: self trigger.
	anExporter exportDuration: self delay.
	anExporter exportRepetition: self repetitions.		
	anExporter exportAttachments: self attachments.
	anExporter exportDescription: self textualDescription.