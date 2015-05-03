instance creation
fromICalString: aString parameters: aDictionary
	^self new
		language: (aDictionary at: 'LANGUAGE' ifAbsent: [ nil ]);
		text: aString;
		yourself