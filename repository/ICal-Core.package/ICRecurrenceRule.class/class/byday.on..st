parsing
byday: aString on: aRule
	| firstLetterIndex day occurrence |
	firstLetterIndex := aString findFirst: [ :each | each isLetter ].
	firstLetterIndex = 1
		ifTrue: [ aRule addWeekday: aString asUppercase ]
		ifFalse: [
			day := (aString allButFirst: firstLetterIndex - 1) asUppercase.
			occurrence := Integer fromICalString: (aString first:  firstLetterIndex - 1).
			aRule addWeekday: day occurrence: occurrence ]