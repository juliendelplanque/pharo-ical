testing-events
testIncludesEventWithUid
	"self debug: #testIncludesEventWithUid"
	self assert: (calendar includesEventWithUid: 'app1').
	self deny: (calendar includesTodoWithUid: 'app1').
	self assert: (calendar includesTodoWithUid: 'todo1').
	self deny: (calendar includesEventWithUid: 'todo1').
	self deny: (calendar includesEventWithUid: 'app2').
	calendar addEvent: event2.
	self assert: (calendar includesEventWithUid: 'app2').
	calendar removeTodo: todo.
	self deny: (calendar includesTodoWithUid: 'todo1')