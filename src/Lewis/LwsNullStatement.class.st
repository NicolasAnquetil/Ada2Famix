"
<express_specification>
ENTITY LwsNullStatement SUBTYPE OF (LwsSimpleStatement);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNullStatement,
	#superclass : #LwsSimpleStatement,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsNullStatement class >> annotation [
	<MSEClass: #LwsNullStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNullStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNullStatement: self
]

{ #category : #'initialize-release' }
LwsNullStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]
