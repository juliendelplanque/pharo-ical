testing
includesComponentWithUid: aString 
	^(self includesEventWithUid: aString)
		or: [ (self includesTodoWithUid: aString)
		or: [ (self includesJournalWithUid: aString)
		or: [ (self includesFreeBusyWithUid: aString)
		or: [ self includesTimezoneWithUid: aString ] ] ] ]