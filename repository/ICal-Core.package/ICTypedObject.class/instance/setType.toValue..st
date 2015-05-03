private
setType: aString toValue: aBoolean
	^aBoolean
		ifTrue: [ self addType: aString ]
		ifFalse: [ self removeType: aString ]