"
I'm the abstract superclass of calendar and card exporters
"
Class {
	#name : #ICExporter,
	#superclass : #Object,
	#instVars : [
		'dataStream',
		'lineStream',
		'stringConversionBlock'
	],
	#category : 'ICal-Core-IO'
}

{ #category : #converting }
ICExporter >> asMIMEDocument [
	^MIMEDocument
		contentType: self contentType 
		content: self dataStream contents
]

{ #category : #accessing }
ICExporter >> contentType [
	self subclassResponsibility 
]

{ #category : #accessing }
ICExporter >> contents [
	^self dataStream contents
]

{ #category : #accessing }
ICExporter >> dataStream [
	^dataStream
]

{ #category : #accessing }
ICExporter >> dataStream: aWriteStream [
	dataStream := aWriteStream
]

{ #category : #exporting }
ICExporter >> export [
	self subclassResponsibility
]

{ #category : #exporting }
ICExporter >> export: aComponent [
	self exportBeginComponent: aComponent iCalType.
	aComponent exportOn: self.
	self exportEndComponent: aComponent iCalType
]

{ #category : #exporting }
ICExporter >> exportAdditionalOf: anObject type: aTypeInformation [
	anObject exportICalParametersOn: self
		
]

{ #category : #'exporting-values' }
ICExporter >> exportBeginComponent: anObject [ 
	self exportProperty: anObject type: ICConversion beginComponentType
]

{ #category : #'exporting-values' }
ICExporter >> exportEnd: anObject [ 
	self exportProperty: anObject type: ICConversion endType
]

{ #category : #'exporting-values' }
ICExporter >> exportEndComponent: anObject [ 
	self exportProperty: anObject type: ICConversion endComponentType
]

{ #category : #'exporting-values' }
ICExporter >> exportGeo: anObject [ 
	self exportProperty: anObject type: ICConversion geoType
]

{ #category : #exporting }
ICExporter >> exportLine: aString [
	self exportNewLine: aString

	
]

{ #category : #exporting }
ICExporter >> exportNewLine: aString [
	| start string |
	start := 0.
	string := self stringConversionBlock value: aString.
	(self newLineIndicesFor: string) do: [ :end |
		start = 0
			ifFalse: [ self dataStream space ].
		self dataStream
			next: (end min: string size) - start
			putAll: string
			startingAt: start + 1.
		self dataStream nextPutAll: String crlf.
		start := end ].
]

{ #category : #'exporting-parameters' }
ICExporter >> exportParameter: aName value: aValue [
	self lineStream
		nextPut: $; ;
		nextPutAll: aName;
		nextPut: $=;
		nextPutAll: aValue
		
]

{ #category : #exporting }
ICExporter >> exportProperty: anObject type: aTypeInformation [ 
	(self shouldExport: anObject) ifTrue: [
		(anObject isCollection
			and: [ aTypeInformation multipleValuesPerLine not
			and: [ anObject isString not ] ]) 
				ifTrue: [
					anObject do: [ :each |
						self exportSingleProperty: each type: aTypeInformation ] ]
				ifFalse: [
					self exportSingleProperty: anObject type: aTypeInformation ] ]
]

{ #category : #exporting }
ICExporter >> exportPropertyName: aTypeInformation [
	self lineStream nextPutAll: aTypeInformation name
]

{ #category : #exporting }
ICExporter >> exportSingleProperty: anObject type: aTypeInformation [ 
	self exportPropertyName: aTypeInformation.
	self exportType: aTypeInformation of: anObject.
	self exportAdditionalOf: anObject type: aTypeInformation.
	self exportValue: anObject type: aTypeInformation.
	self exportLine: self lineStream contents.
	self lineStream reset
]

{ #category : #exporting }
ICExporter >> exportType: aTypeInformation of: anObject [
	(anObject isCollection not or: [ anObject isString ]) ifTrue: [
		anObject iCalType = aTypeInformation defaultType ifFalse: [
			self
				exportParameter: 'VALUE'
				value: anObject iCalType ] ]
		
]

{ #category : #exporting }
ICExporter >> exportValue: anObject type: aTypeInformation [
	self lineStream nextPut: $:.
	(anObject isCollection not or: [ anObject isString ])
			ifTrue: [				
				self lineStream nextPutAll: (aTypeInformation convert: anObject) ]
			ifFalse: [
				anObject
					do: [ :each | self lineStream nextPutAll: (aTypeInformation convert: each) ]
					separatedBy: [ self lineStream nextPut: $, ] ]
]

{ #category : #initialization }
ICExporter >> initialize [
	super initialize.
	self dataStream: (WriteStream on: String new).
	self lineStream: (WriteStream on: String new).
]

{ #category : #testing }
ICExporter >> isVCard [
	^false
]

{ #category : #accessing }
ICExporter >> lineStream [
	^lineStream
]

{ #category : #accessing }
ICExporter >> lineStream: aStream [ 
	lineStream := aStream
]

{ #category : #private }
ICExporter >> newLineIndicesFor: aString [
	^Array streamContents: [ :stream |
		| nextIndex stringSize |
		stringSize := aString size.
		nextIndex := 1.
		[
			nextIndex := nextIndex + 74 min: stringSize.
			nextIndex := nextIndex = stringSize
				ifTrue: [ nextIndex ]
				ifFalse: [ self scanForBeginningCharacterAt: nextIndex in: aString ].
			stream nextPut: nextIndex
				] doWhileTrue: [ nextIndex < stringSize ] ]
]

{ #category : #exporting }
ICExporter >> save [
	self dataStream flush.
	self dataStream close.
]

{ #category : #private }
ICExporter >> scanForBeginningCharacterAt: anInteger in: aString [
	| index codePoint |
	index := anInteger.
	codePoint := (aString at: index) asInteger.
	[ codePoint < 2r10000000 or: [ ((codePoint bitAnd: 2r11000000) bitShift: -6) = 2r10 ] ] whileFalse: [
		index := index - 1.
		codePoint := (aString at: index) asInteger ].
	^index
]

{ #category : #testing }
ICExporter >> shouldExport: anObject [
	^(anObject isNil
		or: [ anObject isCollection
			and: [ anObject isEmpty
			and: [ anObject isString not ] ] ]) not
]

{ #category : #accessing }
ICExporter >> stringConversionBlock [
	stringConversionBlock isNil ifTrue: [
		stringConversionBlock := [ :value | value ] ].
	^stringConversionBlock
]

{ #category : #accessing }
ICExporter >> stringConversionBlock: anObject [
	stringConversionBlock := anObject
]
