testing
testEqual
	self deny: category1 = category2.
	self assert: category1 = (ICCategory summary: 'tennis club').
	self assert: category2 = (ICCategory summary: 'family')