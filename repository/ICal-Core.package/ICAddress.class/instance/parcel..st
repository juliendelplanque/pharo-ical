accessing-types
parcel: aBoolean
	^self
		setType: self class typeParcel
		toValue: aBoolean