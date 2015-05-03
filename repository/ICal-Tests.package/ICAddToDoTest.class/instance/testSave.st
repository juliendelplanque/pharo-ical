testing
testSave
	| savedToDo deadLine todo |
	deadLine := self dateAndTimeClass now + (self durationClass days: 1 hours: 0 minutes: 0 seconds: 0).
	todo := (ICTodo new)
				addCategory: (ICCategory summary: 'second');
				summary: 'writing a letter';
				beLowPriority;
				textualDescription: 'this should be a real letter not an email';
				due: deadLine;
				yourself.
	calendar addTodo: todo.
	savedToDo := calendar todos first.
	self assert: calendar todos size = 1.
	self assert: savedToDo categories anyOne = (ICCategory summary: 'second').
	self assert: savedToDo summary = 'writing a letter'.
	self assert: savedToDo isLowPriority.
	self assert: savedToDo textualDescription 
				= 'this should be a real letter not an email'.
	self assert: savedToDo due = deadLine