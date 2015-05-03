accessing-types
voiceMessage: aBoolean
	^self
		setType: self class typeVoiceMessage
		toValue: aBoolean