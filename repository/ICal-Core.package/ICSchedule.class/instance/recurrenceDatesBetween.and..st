enumerating
recurrenceDatesBetween: aStart and: anEnd
	| dates |
	dates := OrderedCollection new.
	(self start between: aStart and: anEnd)
		ifTrue: [ dates add: self start ].
	dates addAll: self event recurrenceDates.
	dates addAll: (self recurrenceSchedules gather: [ :each | each datesBetween: aStart and: anEnd ]).
	^ dates asSet