private
printMonthnumbersOn: aStream
	self
		printIntegers: self monthnumbers
		title: 'BYMONTH'
		on: aStream