"
<express_specification>
ENTITY LwsPrivateRecordType SUBTYPE OF (LwsRecordType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPrivateRecordType,
	#superclass : #LwsRecordType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPrivateRecordType class >> annotation [
	<MSEClass: #LwsPrivateRecordType super: #LwsRecordType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPrivateRecordType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPrivateRecordType: self
]

{ #category : #'initialize-release' }
LwsPrivateRecordType >> initialize [
	<generatedByPlatypus>
	super initialize
]
