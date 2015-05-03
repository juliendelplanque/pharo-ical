testing
checkByRulesToSeeIfAnyAre: byRuleTest
	^self byRules anySatisfy: [:each | each perform:byRuleTest ]