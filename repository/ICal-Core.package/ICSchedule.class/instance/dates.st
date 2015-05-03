enumerating
dates
	^ self hasMoreThanOneDate
		ifTrue: [ 
			self isInfinite
				ifTrue: [ ^ InfiniteScheduleLengthError new signal: 'You need to use #datesBetween:and: or #between:and:do:' ]
				ifFalse: [ self datesBetween: self start and: self end ] ]
		ifFalse: [ Array with: self event start ]