actions
parseFile
	| importedCalendar |
	importedCalendar := ICCalendarHandParser parseCalendarString: self fileContent.
	self components: importedCalendar components asOrderedCollection