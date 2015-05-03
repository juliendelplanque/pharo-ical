instance creation
fromICalString: aString parameters: aDictionary
	| instance |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	instance id: (String fromICalString: aString  parameters: aDictionary).
	^instance