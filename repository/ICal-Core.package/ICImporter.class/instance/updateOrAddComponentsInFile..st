synchronizing
updateOrAddComponentsInFile: aCollection

	aCollection do: [ :each | 
		(self calendar includesComponentWithUid: each uid) 
			ifTrue: [ self calendar removeComponentWithUid: each uid ] .
		self calendar addComponent: each ]