private
printMinutesOn: aStream
	self
		printIntegers: self minutes
		title: 'BYMINUTE'
		on: aStream