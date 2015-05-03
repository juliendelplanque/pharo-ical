freebusy
includesFreeBusyWithUid: aString 
	^self freeBusy anySatisfy: [:each | each uid = aString]