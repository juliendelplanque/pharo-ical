todos
removeTodoWithUid: aString
	| todo |
	todo := self todos detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeTodo: todo.