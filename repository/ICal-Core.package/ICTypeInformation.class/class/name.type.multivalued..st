instance creation
name: aString type: aClass multivalued: aBoolean
	^self new
		name: aString;
		defaultType: aClass;
		multipleValuesPerLine: aBoolean;
		yourself