freebusy
removeFreeBusyWithUid: aString
	| freebusy |
	freebusy := self freeBusy detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeFreeBusy: freebusy.
	