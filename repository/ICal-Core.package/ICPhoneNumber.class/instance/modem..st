accessing-types
modem: aBoolean
	^self
		setType: self class typeModem
		toValue: aBoolean