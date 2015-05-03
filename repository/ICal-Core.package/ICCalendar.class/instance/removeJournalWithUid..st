journals
removeJournalWithUid: aString
	| journal |
	journal := self journals detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeEvent: journal.
	