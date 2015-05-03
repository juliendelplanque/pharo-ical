as yet unclassified
testOrdinalIndexes
	self assert: (byRule monthlyOrdinalIndexesFor: date) equals: #(2 -4).
	self assert: (byRule yearlyOrdinalIndexesFor: date) equals: #(49 -4)