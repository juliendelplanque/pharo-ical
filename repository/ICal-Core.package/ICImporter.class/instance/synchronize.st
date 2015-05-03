actions
synchronize
	self parseFile.

	"synchronize events with known ids"
	self synchronizeComponents: (self components select: [:item |
		item uid ~= 0 and: [ item uid notNil ]]).

	"add events with unknown ids"
	self components  do: [ :component |
		component uid = 0 ifTrue: [self calendar addComponent: component]].