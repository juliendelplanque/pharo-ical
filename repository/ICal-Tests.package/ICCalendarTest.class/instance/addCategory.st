testing-categories
addCategory
	| cat1 cat2 categoryNumber |
	cat1 := ICCategory summary: 'cat1'.
	cat1
		color: 'blue';
		textualDescription: 'for ???'.
	cat2 := ICCategory summary: 'cat2'.
	cat2
		color: 'green';
		textualDescription: 'for ???'.
	categoryNumber := calendar categories size.
	calendar addCategory: cat1.
	self assert: calendar categories size = (categoryNumber + 1).
	calendar addCategory: cat2.
	self assert: calendar categories size = (categoryNumber + 2)
