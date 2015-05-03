testing
testColor
  
   self assert: (calendar categoryWithSummary: 'family') hasColor.
   self assert: (calendar categoryWithSummary: 'tennis club') color = 'red'.
   
   category1 color: 'purple'.
   category2 color: 'yellow'.

   self assert: (calendar categoryWithSummary: 'family') hasColor.
   self deny: (calendar categoryWithSummary: 'tennis club') color = 'red'.