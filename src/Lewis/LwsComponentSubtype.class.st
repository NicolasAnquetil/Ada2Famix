"
<express_specification>
ENTITY LwsComponentSubtype SUBTYPE OF (LwsEntity);
	isAliased : Boolean := false;
	definition : LwsSubtypeIndication;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsComponentSubtype,
	#superclass : #LwsEntity,
	#instVars : [
		'definition',
		'isAliased'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsComponentSubtype class >> annotation [
	<MSEClass: #LwsComponentSubtype super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsComponentSubtype >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitComponentSubtype: self
]

{ #category : #'explicit attributes' }
LwsComponentSubtype >> definition [
	<MSEProperty: #definition type: #LwsSubtypeIndication>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsComponentSubtype >> definition: aSubtypeIndication [
	<generatedByPlatypus>
	definition := aSubtypeIndication
]

{ #category : #'initialize-release' }
LwsComponentSubtype >> initialize [
	<generatedByPlatypus>
	super initialize.
	isAliased := nil.
	definition := nil
]

{ #category : #'explicit attributes' }
LwsComponentSubtype >> isAliased [
	<MSEProperty: #isAliased type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAliased ifNil: [ isAliased := self isAliasedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsComponentSubtype >> isAliased: aBoolean [
	<generatedByPlatypus>
	isAliased := aBoolean
]

{ #category : #'explicit attributes' }
LwsComponentSubtype >> isAliasedDefaultValue [
	<MSEProperty: #isAliased type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
