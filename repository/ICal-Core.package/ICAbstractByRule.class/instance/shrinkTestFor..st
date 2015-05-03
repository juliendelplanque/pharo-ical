as yet unclassified
shrinkTestFor: each
	^ (self byValues includes: (each perform: self dateTestCriteria)) not