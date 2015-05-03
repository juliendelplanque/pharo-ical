accessing-types
car: aBoolean
	^self
		setType: self class typeCar
		toValue: aBoolean