testing
testStati
	| stati |
	stati := ICEvent possibleStati asSet.
	self assert: stati size = 3.
	self assert: (stati includes: ICEvent statusCanceled).
	self assert: (stati includes: ICEvent statusConfirmed).
	self assert: (stati includes: ICEvent statusTentative).
	stati := ICTodo possibleStati asSet.
	self assert: stati size = 4.
	self assert: (stati includes: ICTodo statusCanceled).
	self assert: (stati includes: ICTodo statusNeedsAction).
	self assert: (stati includes: ICTodo statusInProcess).
	self assert: (stati includes: ICTodo statusCompleted).
	stati := ICJournal possibleStati asSet.
	self assert: stati size = 3.
	self assert: (stati includes: ICJournal statusCanceled).
	self assert: (stati includes: ICJournal statusDraft).
	self assert: (stati includes: ICJournal statusFinal)