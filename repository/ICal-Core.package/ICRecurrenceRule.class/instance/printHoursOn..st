private
printHoursOn: aStream
	self
		printIntegers: self hours
		title: 'BYHOUR'
		on: aStream