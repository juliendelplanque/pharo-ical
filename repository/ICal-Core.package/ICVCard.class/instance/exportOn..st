exporting
exportOn: anExporter
	anExporter exportVersion: self version.
	anExporter exportName: self name.
	anExporter exportFullname: self fullname.	
	anExporter exportNickname: self nickname.
	anExporter exportPhoto: self photo.
	anExporter exportBirthday: self birthday.
	anExporter exportAddresses: self addresses.
	anExporter exportTelephones: self phoneNumbers.
	anExporter exportEmails: self emailAddresses.
	anExporter exportTitle: self title.
	
	anExporter exportTimeZone: self timeZone.
	anExporter exportGeo: self geo.
	anExporter exportOrganization: self organization.
	anExporter exportCategories: self categories.
	anExporter exportNotes: self notes.
	anExporter exportUrl: self url.
	
	anExporter exportAim: self aimids.
	anExporter exportIcq: self icqids.
	anExporter exportMsn: self msnids.
	anExporter exportYahoo: self yahooids.