accessing-types
x400: aBoolean
	^self
		setType: self class typeX400
		toValue: aBoolean