"
<express_specification>
ENTITY LwsMembershipIteration SUBTYPE OF (LwsIterationPolicy);
	identifier : String;
	reverse : boolean := false;
	range : LwsRange;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsMembershipIteration,
	#superclass : #LwsIterationPolicy,
	#instVars : [
		'identifier',
		'range',
		'reverse'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsMembershipIteration class >> annotation [
	<MSEClass: #LwsMembershipIteration super: #LwsIterationPolicy>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsMembershipIteration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitMembershipIteration: self
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> identifier [
	<MSEProperty: #identifier type: #String>
	<generatedByPlatypus>
	^ identifier
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> identifier: aString [
	<generatedByPlatypus>
	identifier := aString
]

{ #category : #'initialize-release' }
LwsMembershipIteration >> initialize [
	<generatedByPlatypus>
	super initialize.
	identifier := nil.
	reverse := nil.
	range := nil
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> range: aRange [
	<generatedByPlatypus>
	range := aRange
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> reverse [
	<MSEProperty: #reverse type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ reverse ifNil: [ reverse := self reverseDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> reverse: aBoolean [
	<generatedByPlatypus>
	reverse := aBoolean
]

{ #category : #'explicit attributes' }
LwsMembershipIteration >> reverseDefaultValue [
	<MSEProperty: #reverse type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
