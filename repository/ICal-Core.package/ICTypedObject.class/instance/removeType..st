accessing-types
removeType: aString
	^self types remove: aString ifAbsent: [ "ignore silentyl" ]