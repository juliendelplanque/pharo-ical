testing
testIDs
	| aTodo |
	self assert: appointment1 uid = 'app1'.
	self assert: appointment2 uid = 'app2'.
	self assert: todo uid = 'todo1'.
	calendar addTodo: (
		ICTodo new
			summary: 'cleaning';
			uid: 'todo2';
			due: DateAndTime tomorrow;
			yourself).
	aTodo := ICTodo summary: 'shopping'.
	aTodo
		uid: 'todo3';
		due: DateAndTime tomorrow.
	calendar addTodo: aTodo.
	self assert: aTodo uid = 'todo3'.
	self assert: (calendar eventWithUid: 'app1') == appointment1.
	self assert: (calendar todoWithUid: 'todo2') summary = 'cleaning'