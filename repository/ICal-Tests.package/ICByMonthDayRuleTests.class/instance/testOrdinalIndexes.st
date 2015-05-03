as yet unclassified
testOrdinalIndexes
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 1 day: 3)) equals: #(3 -28).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 2 day: 3)) equals: #(3 -26).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(3 -28).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 4 day: 3)) equals: #(3 -27)