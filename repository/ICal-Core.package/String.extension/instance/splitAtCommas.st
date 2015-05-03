*ICal-Core
splitAtCommas
	| indices start parts |
	indices := OrderedCollection new.
	self withIndexDo: [ :each :index |
		(each = $,
			and: [ index > 1
			and: [ (self at: index - 1) ~= $\ ] ])
			ifTrue: [ indices add: index ] ].
	start := 1.
	parts := OrderedCollection new: indices size + 1.
	indices do: [ :each |
		parts add: (self copyFrom: start to: each - 1).
		start := each + 1 ].
	parts add: (self copyFrom: start to: self size).
	^parts