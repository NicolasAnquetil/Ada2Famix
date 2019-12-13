"
<express_specification>
ENTITY LwsNullRecordType SUBTYPE OF (LwsRecordType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNullRecordType,
	#superclass : #LwsRecordType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsNullRecordType class >> annotation [
	<MSEClass: #LwsNullRecordType super: #LwsRecordType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNullRecordType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNullRecordType: self
]

{ #category : #'initialize-release' }
LwsNullRecordType >> initialize [
	<generatedByPlatypus>
	super initialize
]
