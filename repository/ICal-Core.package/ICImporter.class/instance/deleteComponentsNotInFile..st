synchronizing
deleteComponentsNotInFile: aCollection

	| uids |
	uids := (self calendar components collect: [ :each | each uid ]) asOrderedCollection.
	aCollection do: [ :each | uids remove: each uid ifAbsent: [nil]].
	
	uids do: [ :uid | self calendar removeComponentWithUid: uid ].