instance creation
fromICalString: aString parameters: aDictionary
	| instance parts |
	instance := self new.
	parts := aString subStringsFull: #($;).
	instance name: (parts isEmpty ifTrue: [ '' ] ifFalse: [ String fromICalString: parts first  parameters: aDictionary ]).
	instance unitNames: (
		parts allButFirst
			collect: [ :each | String fromICalString: each parameters: aDictionary ]
			thenSelect: [ :each | each notEmpty ]).
	^instance