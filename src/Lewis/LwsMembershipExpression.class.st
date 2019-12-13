"
<express_specification>
ENTITY LwsMembershipExpression SUBTYPE OF (LwsLogicalExpression);
	included : Boolean := true;
DERIVE
	SELF\LwsBinaryExpression.opString : STRING ::= 
			self included
				ifTrue: [ 'in' ]
				ifFalse: [ 'not in' ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsMembershipExpression,
	#superclass : #LwsLogicalExpression,
	#instVars : [
		'included'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsMembershipExpression class >> annotation [
	<MSEClass: #LwsMembershipExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsMembershipExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitMembershipExpression: self
]

{ #category : #'explicit attributes' }
LwsMembershipExpression >> included [
	<MSEProperty: #included type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ included ifNil: [ included := self includedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsMembershipExpression >> included: aBoolean [
	<generatedByPlatypus>
	included := aBoolean
]

{ #category : #'explicit attributes' }
LwsMembershipExpression >> includedDefaultValue [
	<MSEProperty: #included type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ true
]

{ #category : #'initialize-release' }
LwsMembershipExpression >> initialize [
	<generatedByPlatypus>
	super initialize.
	included := nil
]

{ #category : #'derived attributes' }
LwsMembershipExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self included
		ifTrue: [ 'in' ]
		ifFalse: [ 'not in' ]
]
