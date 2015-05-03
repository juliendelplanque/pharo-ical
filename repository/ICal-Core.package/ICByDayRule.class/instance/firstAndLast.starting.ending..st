growing
firstAndLast: dayOfWeek starting: aStart ending: anEnd
	| firstAndLast dateArray |
	dateArray := #(1 2 3 4 5 6 7).
	firstAndLast := Array new: 2.
	0 to: 6 do: [ :each | 
		aStart dayOfWeek + each = dayOfWeek
			ifTrue: [ firstAndLast at: 1 put: 2 ] ]