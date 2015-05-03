as yet unclassified
testOrdinalIndexes
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass  year: 2004 month: 1 day: 3)) equals: #(1 -52).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(10 -43).
	byRule weekStart: 'TH'.
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(9 -44).
	byRule weekStart: 'SA'.
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(9 -43)