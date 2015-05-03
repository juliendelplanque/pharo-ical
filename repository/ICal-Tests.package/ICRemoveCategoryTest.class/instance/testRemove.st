testing
testRemove
	| numCats |
	numCats := calendar categories size.
	
	self assert: (calendar categories includes: category).
  	self remove: 'irishdance'.
  	self assert: (calendar categories size = (numCats - 1)).
	self deny: (calendar categories includes: category).
  	self should: [ calendar categoryWithSummary: 'irishdance' ] raise: Error
  