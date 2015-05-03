testing
isInfinite
	^self recurrenceSchedules anySatisfy: [:each | each isInfinite ] 