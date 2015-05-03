duration
fromICalDuractionString: aString class: aClass
	| positive value weeks days hours minutes seconds duration |
	positive := aString first ~= $-.
	value := aString copyAfter: $P.
	^(value includes: $W)
		ifTrue: [
			weeks := (value copyUpTo: $W) asInteger.
			aClass weeks: (positive ifTrue: [ weeks ] ifFalse: [ weeks negated ] )]
		ifFalse: [
			days := hours := minutes := seconds := 0.
			self flag: #XXX. "copy pasted code"
			(value includes: $D) ifTrue: [
				days := (value copyUpTo: $D) asInteger.
				value := value copyAfter: $D ].
			(value includes: $H) ifTrue: [
				hours := (value copyUpTo: $H) asInteger.
				value := value copyAfter: $H ].
			(value includes: $M) ifTrue: [
				minutes := (value copyUpTo: $M) asInteger.
				value := value copyAfter: $M ].
			(value includes: $S) ifTrue: [
				seconds := (value copyUpTo: $S) asInteger.
				value := value copyAfter: $S ].
			duration := aClass days: days hours: hours minutes: minutes seconds: seconds.
			positive
				ifTrue: [ duration ]
				ifFalse: [ duration negated ] ]
		