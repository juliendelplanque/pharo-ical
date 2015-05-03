private
printWeeknumbersOn: aStream
	self
		printIntegers: self weeknumbers
		title: 'BYWEEKNO'
		on: aStream