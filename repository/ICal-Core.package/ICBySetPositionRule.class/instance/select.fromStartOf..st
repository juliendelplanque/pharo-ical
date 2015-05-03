shrinking
select: indexFromStart fromStartOf: someDates
	| selectedDates |
	selectedDates := OrderedCollection new.
	(someDates groupedBy: [ :each | self groupFor: each ])
		do: [ :eachGroup | 
			indexFromStart > eachGroup size
				ifFalse: [ selectedDates add: (eachGroup at: indexFromStart) ] ].
	^ selectedDates sort