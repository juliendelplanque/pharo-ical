accessing-types
bulletinBoard: aBoolean
	^self
		setType: self class typeBulletinBoard
		toValue: aBoolean