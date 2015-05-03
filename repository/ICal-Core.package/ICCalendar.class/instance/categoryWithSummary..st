categories
categoryWithSummary: aString
	^self categories detect: [ :each | each summary = aString]