instance creation
fromICalString: aString parameters: aDictionary
	| instance |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	instance address: (String fromICalString: aString parameters: aDictionary).
	^instance