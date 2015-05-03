dispatching
doesNotUnderstand: aMessage
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