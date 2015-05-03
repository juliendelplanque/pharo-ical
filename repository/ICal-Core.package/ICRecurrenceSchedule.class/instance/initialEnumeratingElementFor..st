enumerating
initialEnumeratingElementFor: aStart
	| element startDate |
	element := self start.	"Performance optimization. Avoid going through unnecesary days if easy."
	startDate := aStart asDate.
	(startDate > element asDate and: [ self everyDayAtSameTimes ])
		ifTrue: [ element := self dateAndTimeClass date: startDate time: element asDateAndTime ].
	^ element