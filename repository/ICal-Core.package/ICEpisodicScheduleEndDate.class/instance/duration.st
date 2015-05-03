accessing
duration
	| duration |
	duration := Duration zero.
	(Interval from: 1 to: self occurrences - 1) do: [ :each | duration := duration + (self scheduleArrayAt: each) ].
	^ duration