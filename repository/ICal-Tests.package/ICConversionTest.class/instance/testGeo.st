testing
testGeo
	| point |
	point := Point fromICalString: '37.386013;-122.082932'.
	self assert: point x = 37.386013.
	self assert: point y = -122.082932.
	self assert: point asICalString = '37.386013;-122.082932'