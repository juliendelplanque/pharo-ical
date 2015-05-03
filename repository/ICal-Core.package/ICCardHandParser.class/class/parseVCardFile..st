instance creation
parseVCardFile: aPath
	^self parseVCardString: (FileStream readOnlyFileNamed: aPath) contentsOfEntireFile