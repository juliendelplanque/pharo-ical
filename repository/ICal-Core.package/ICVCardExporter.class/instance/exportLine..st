exporting
exportLine: aString
	ICCardVersion value >= 3.0
		ifTrue: [ self exportNewLine: aString ]
		ifFalse: [ self exportOldLine: aString ]