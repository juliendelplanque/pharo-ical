testing
testImportName
	| importedCalendar |
	importedCalendar := ICCalendarHandParser parseCalendarString: importCommand fileContent. 
	self assert: importedCalendar name = 'veriveri''s Calendar'.