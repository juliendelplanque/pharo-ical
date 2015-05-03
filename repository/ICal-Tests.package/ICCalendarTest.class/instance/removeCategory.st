testing-categories
removeCategory
   | categoryNumber |
   categoryNumber := calendar categories size.
   self assert: (calendar categories includes: category1).
   calendar removeCategory: category1.
   self assert: (calendar categories size = (categoryNumber -1)).
   self deny: (calendar categories includes: category1).
   
