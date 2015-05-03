instance creation
fromICalString: aString parameters: aDictionary
	| instance parts |
	instance := self new.
	parts := aString  subStringsFull: #($;).
	instance familyName: (String fromICalString: parts first parameters: aDictionary).
	instance givenName: (String fromICalString: parts second parameters: aDictionary).
	
	"there should be no need to do these checks, but VB programmers are idiots"
	parts size >= 3 ifTrue: [
		instance additionalNames: (self unsplit: parts third parameters: aDictionary) ].
	parts size >= 4 ifTrue: [
		instance honorificPrefixes: (self unsplit: parts fourth parameters: aDictionary) ].
	parts size >= 5 ifTrue: [
		instance honorificSuffixes: (self unsplit: parts fifth parameters: aDictionary) ].
	^instance