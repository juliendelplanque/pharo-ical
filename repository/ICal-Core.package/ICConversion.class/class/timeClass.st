accessing
timeClass
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: #TimeOfDay ]
		ifFalse: [ Time ]