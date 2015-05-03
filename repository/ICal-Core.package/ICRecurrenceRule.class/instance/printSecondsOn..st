private
printSecondsOn: aStream
	self
		printIntegers: self seconds
		title: 'BYSECOND'
		on: aStream