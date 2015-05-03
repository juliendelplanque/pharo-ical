instance creation
fromICalString: aString parameters: aDictionary
	self flag: #todo. "look up in calendar or something like that"
	^self summary: (String fromICalString: aString parameters: aDictionary)