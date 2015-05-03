endDates
setEndDateFor: anICRecurrenceRule
	endDate := anICRecurrenceRule hasRepetition
		ifTrue: [ 
			anICRecurrenceRule repetition isInteger
				ifTrue: [ 
					self cache: true.
					ICEpisodicScheduleEndDate new occurrences: anICRecurrenceRule repetition ]
				ifFalse: [ ICDefinedScheduleEndDate new lastDay: anICRecurrenceRule repetition ] ]
		ifFalse: [ ICInfiniteScheduleEndDate new ].
	endDate schedule: self