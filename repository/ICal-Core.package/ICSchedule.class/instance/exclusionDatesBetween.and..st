enumerating
exclusionDatesBetween: aStart and: anEnd
	| dates |
	dates := self event exclusionDates copy.
	dates addAll: (self exclusionSchedules gather: [ :each | each datesBetween: aStart and: anEnd ]).
	^ dates asSet