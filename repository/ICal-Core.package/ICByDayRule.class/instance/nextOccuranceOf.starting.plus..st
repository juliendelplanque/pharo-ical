growing
nextOccuranceOf: byValue starting: startDate plus: atLeast
	| dayOfWeek |
	dayOfWeek := self weekDayNumberFor: byValue.
	^ startDate dayOfWeek > dayOfWeek
		ifTrue: [ dayOfWeek - startDate dayOfWeek + atLeast + 7 ]
		ifFalse: [ dayOfWeek - startDate dayOfWeek + atLeast ]