accessing-types
personalCommunication: aBoolean
	^self
		setType: self class typePersonalCommunication
		toValue: aBoolean