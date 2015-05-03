testing
testExplanation

    self assert: (calendar categoryWithSummary: 'family') textualDescription = 'for family events'.
    self assert: (calendar categoryWithSummary: 'tennis club') textualDescription = 'this category is for tennis club events'.
    self deny: category1 textualDescription = ''.