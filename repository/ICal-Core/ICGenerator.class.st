Class {
	#name : #ICGenerator,
	#superclass : #Object,
	#category : 'ICal-Core-Parser'
}

{ #category : #dispatching }
ICGenerator >> addUnknownProperty: aProperty [
	self subclassResponsibility 
]

{ #category : #utilities }
ICGenerator >> asSelector: aString [
	| parts |
	parts := aString substrings: #($-).
	^ String
		streamContents: [ :stream | 
			parts do: [ :each | stream nextPutAll: each asLowercase ].
			stream nextPut: $: ]
]

{ #category : #dispatching }
ICGenerator >> begin: aString [
	self subclassResponsibility
]

{ #category : #productions }
ICGenerator >> contentline: aName parameters: aCollection value: aString [
	| selector |
	selector := self asSelector: aName.
	(self noParameterSelectors includes: selector)
		ifTrue: [
			self
				perform: selector asSymbol
				withArguments: (Array with: aString) ]
		ifFalse: [
			self
				perform: (selector , 'parameters:') asSymbol
				withArguments: (Array with: aString with: aCollection) ]
]

{ #category : #utilities }
ICGenerator >> createValue: aString parameters: aDictionary default: aType [
	| iCalType |
	iCalType := aDictionary at: 'VALUE' ifAbsent: [ aType ].
	^self createValue: aString parameters: aDictionary type: iCalType
]

{ #category : #utilities }
ICGenerator >> createValue: aString parameters: aDictionary type: iCalType [
	^(ICConversion propertyClassFor: iCalType)
		fromICalString: aString parameters: aDictionary
]

{ #category : #dispatching }
ICGenerator >> doesNotUnderstand: aMessage [
	| property |
	^((aMessage selector endsWith: 'parameters:')
		and: [ aMessage arguments size = 2 ])
			ifFalse: [ super doesNotUnderstand: aMessage ]
			ifTrue: [ 
				property := ICUnknownProperty new
				 	name: (aMessage selector copyUpTo: $:);
					value: aMessage arguments first;
					parameters: aMessage arguments second;
					yourself.
				self addUnknownProperty: property ]
]

{ #category : #dispatching }
ICGenerator >> end: aString [
	self subclassResponsibility 
]

{ #category : #dispatching }
ICGenerator >> noParameterSelectors [
	^#(
		'begin:'
		'end:'
	)
]

{ #category : #accessing }
ICGenerator >> product [
	self subclassResponsibility 
]

{ #category : #utilities }
ICGenerator >> splitAtCommas: aString [
	^aString splitAtCommas
]
