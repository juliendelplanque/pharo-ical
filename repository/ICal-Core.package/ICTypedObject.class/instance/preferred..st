accessing-types
preferred: aBoolean
	^self
		setType: self class typePreferred
		toValue: aBoolean