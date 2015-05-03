testing
testUser
	| user |
	user := ICUser new.
	self assert: calendar users isEmpty.
	calendar addUser: user.
	self deny: calendar users isEmpty.
	self assert: calendar users anyOne == user