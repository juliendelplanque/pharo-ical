testing-categories
testCategoryWithTitle
	| cat1 cat2 cat3 |
	cat1 := ICCategory summary: 'cat1'.
	cat2 := ICCategory summary: 'cat2'.
	cat3 := ICCategory summary: 'cat3'.
	calendar
		addCategory: cat1;
		addCategory: cat2;
		addCategory: cat3.
	self assert: (calendar categoryWithSummary: 'cat1') == cat1.
	self assert: (calendar categoryWithSummary: 'cat2') == cat2.
	self assert: (calendar categoryWithSummary: 'cat3') == cat3.
	calendar removeCategory: cat1.
	self should: [ calendar categoryWithSummary: 'cat1' ] raise: Error