testing
testIDs
	| aTodo |
	self assert: appointment1 uid = 'app1'.
	self assert: appointment2 uid = 'app2'.
	self assert: todo uid = 'todo1'.
	calendar addEvent: (
		ICTodo new
			summary: 'cleaning';
			uid: 'todo2';
			yourself).
	aTodo := ICTodo summary: 'shopping'.
	aTodo uid: 'todo3'.
	calendar addEvent: aTodo.
	self assert: aTodo uid = 'todo3'.
	self assert: (calendar eventWithUid: 'app1') == appointment1.
	self assert: (calendar eventWithUid: 'todo2') summary = 'cleaning'