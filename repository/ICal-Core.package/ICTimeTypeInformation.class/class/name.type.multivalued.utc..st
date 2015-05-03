instance creation
name: aString type: aClass multivalued: aBoolean utc: anotherBoolean
	^self new
		name: aString;
		defaultType: aClass;
		multipleValuesPerLine: aBoolean;
		needsUtc: anotherBoolean;
		yourself