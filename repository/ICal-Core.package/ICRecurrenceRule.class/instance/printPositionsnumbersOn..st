private
printPositionsnumbersOn: aStream
	self
		printIntegers: self positions
		title: 'BYSETPOS'
		on: aStream