testing
shouldStopFor: anElement before: anEndDate
	shouldStop
		ifFalse: [ 
			self schedule dateCache size >= self occurrences
				ifTrue: [ 
					end := self schedule dateCache last.
					^ shouldStop := true ].
			^ anElement > anEndDate ].
	^ shouldStop