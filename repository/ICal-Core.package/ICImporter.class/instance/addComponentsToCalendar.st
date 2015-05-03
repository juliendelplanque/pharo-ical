importing
addComponentsToCalendar
	self components do: [ :each |
			self calendar addComponent: each ]