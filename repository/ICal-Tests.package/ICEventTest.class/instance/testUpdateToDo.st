testing
testUpdateToDo
	| todoEvent |
	todoEvent := ICTodo summary: 'todo'.
	todoEvent updateEventWith: todo.
	self assert: todoEvent summary = todo summary.
	self assert: todoEvent categories = todo categories.
	self assert: todoEvent textualDescription = todo textualDescription.
	self assert: todoEvent status = todo status.
	self assert: todoEvent priority = todo priority.
	self assert: todoEvent created = todo created.
	self assert: todoEvent lastModified = todo lastModified.
	self assert: todoEvent sequenceNumber = todo sequenceNumber.
	self assert: todoEvent due = todo due