"
<express_specification>
ENTITY LwsLoopStatement SUBTYPE OF (LwsCompoundStatement);
	stamp : OPTIONAL String;
	policy : OPTIONAL LwsIterationPolicy;
	statements : list OF LwsStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLoopStatement,
	#superclass : #LwsCompoundStatement,
	#instVars : [
		'statements',
		'stamp',
		'policy'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsLoopStatement class >> annotation [
	<MSEClass: #LwsLoopStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsLoopStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLoopStatement: self
]

{ #category : #'initialize-release' }
LwsLoopStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	stamp := nil.
	policy := nil.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> policy [
	<MSEProperty: #policy type: #LwsIterationPolicy>
	<generatedByPlatypus>
	^ policy
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> policy: anIterationPolicyOrNil [
	<generatedByPlatypus>
	policy := anIterationPolicyOrNil
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> stamp [
	<MSEProperty: #stamp type: #String>
	<generatedByPlatypus>
	^ stamp
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> stamp: aStringOrNil [
	<generatedByPlatypus>
	stamp := aStringOrNil
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsLoopStatement >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
