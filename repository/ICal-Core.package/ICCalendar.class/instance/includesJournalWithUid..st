journals
includesJournalWithUid: aString 
	^self journals anySatisfy: [:each | each uid = aString]