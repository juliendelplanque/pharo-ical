growing
grow: oldDates
	| newDates |
	newDates := OrderedCollection new.
	(oldDates groupedBy: [ :each | self groupFor: each ])
		do: [ :existingDates | newDates addAll: (self newDatesFrom: self byValues considering: existingDates) ].
	^ newDates sort