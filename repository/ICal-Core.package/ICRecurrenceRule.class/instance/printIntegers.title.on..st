private
printIntegers: aCollection title: aString on: aStream
	aStream
		nextPutAll: aString;
		nextPut: $=.
	aCollection
		do: [ :each | aStream nextPutAll: each asICalString ]
		separatedBy: [ aStream nextPut: $, ]