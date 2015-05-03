private
printMonthdaysOn: aStream
	self
		printIntegers: self monthdays
		title: 'BYMONTHDAY'
		on: aStream