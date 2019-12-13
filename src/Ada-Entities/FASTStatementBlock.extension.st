Extension { #name : #FASTStatementBlock }

{ #category : #'*Ada-Entities' }
FASTStatementBlock >> declaredStatementParent [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
 	But in Ada we have this case. So we define #declaredStatementParent to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #fastBehaviouralParent property. Thus we do not want to export it two times.
	"

	<MSEProperty: #declaredStatementParent type: #FASTAdaDeclareStatement opposite: #statementBlock>
	<MSEComment: 'Declared statement containing this block.'>
	<derived>
	^ self fastBehaviouralParent
]

{ #category : #'*Ada-Entities' }
FASTStatementBlock >> declaredStatementParent: anEntity [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
 	But in Ada we have this case. So we define #declaredStatementParent to be good with the pragmas. 
	"

	^ self fastBehaviouralParent: anEntity
]
