testing
removeComponentWithUid: aString
	(self includesEventWithUid: aString)
		ifTrue: [ ^self removeEventWithUid: aString ].
	(self includesTodoWithUid: aString)
		ifTrue: [ ^self removeTodoWithUid: aString ].
	(self includesJournalWithUid: aString)
		ifTrue: [ ^self removeJournalWithUid: aString  ].
	(self includesFreeBusyWithUid: aString)
		ifTrue: [ ^self removeJournalWithUid: aString ].
	(self includesTimezoneWithUid: aString)
		ifTrue: [ ^self removeTimezoneWithUid: aString ]