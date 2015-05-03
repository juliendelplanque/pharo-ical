enumerating
between: aStart and: anEnd do: aBlock
	"from Cuis 99"

	| element end i |
	"Performance optimization. Avoid going through unnecesary days if easy."
	end := self enumeratingEndDateConsidering: anEnd.
	element := self initialEnumeratingElementFor: aStart.
	i := 1.
	[ element < aStart ]
		whileTrue: [ 
			element := self occurrenceAfter:element .
			 ].
	[ self shouldStopFor: element before: end ]
		whileFalse: [ cache ifTrue: [self dateCache add: element].
			aBlock value: element.
			element := self occurrenceAfter:element  ]