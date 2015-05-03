as yet unclassified
testOrdinalIndexes
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 1 day: 3)) equals: #(3 -363).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 2 day: 3)) equals: #(34 -332).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2007 month: 3 day: 3)) equals: #(62 -303).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2007 month: 4 day: 3)) equals: #(93 -272)