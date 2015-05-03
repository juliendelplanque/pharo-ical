instance creation
parseCalendarFile: aPath
	^self parseCalendarString: (FileStream readOnlyFileNamed: aPath) contentsOfEntireFile