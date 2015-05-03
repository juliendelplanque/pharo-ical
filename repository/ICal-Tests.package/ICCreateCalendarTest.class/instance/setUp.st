running
setUp
	| calendar |
	user := ICUser new.
	calendar := ICCalendar name: 'veriveri''s Calendar'.
	calendar addUser: user.
	calendars := OrderedCollection with: calendar