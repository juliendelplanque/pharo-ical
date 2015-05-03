accessing-types
postal: aBoolean
	^self
		setType: self class typePostal
		toValue: aBoolean