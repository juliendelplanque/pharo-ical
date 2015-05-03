length
trimEndOf: someDates
	someDates size > self occurrences
		ifTrue: [ ^ someDates first: self occurrences ].
	^ someDates