private
parse: aSymbol
	| calendar importer |
	calendar := ICCalendar new.
	importer := ICImporter new
		calendar: calendar;
		fileContent: (self perform: aSymbol);
		yourself.
	importer import.
	self assert: calendar timezones size = 1.
	^calendar timezones first