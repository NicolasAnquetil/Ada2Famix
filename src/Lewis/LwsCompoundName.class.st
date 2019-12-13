"
<express_specification>
ENTITY LwsCompoundName SUBTYPE OF (LwsEntity);
	elements : List OF String ::= OrderedCollection new;
DERIVE
	name : String ::= self elements first;
	suffixes : List OF String ::= self elements allButFirst;
	asString : String ::= String streamContents: [ :s | self elements do: [ :each | s nextPutAll: each ] separatedBy: [ s nextPut: $. ] ];
WHERE
	mustHaveAtLeastOneElement :: self elements size >= 1;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCompoundName,
	#superclass : #LwsEntity,
	#instVars : [
		'elements'
	],
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsCompoundName class >> annotation [
	<MSEClass: #LwsCompoundName super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCompoundName >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCompoundName: self
]

{ #category : #'derived attributes' }
LwsCompoundName >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ String streamContents: [ :s | self elements do: [ :each | s nextPutAll: each ] separatedBy: [ s nextPut: $. ] ]
]

{ #category : #'explicit attributes' }
LwsCompoundName >> elements [
	<MSEProperty: #elements type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ elements ifNil: [ elements := self elementsDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsCompoundName >> elements: aListOfString [
	<generatedByPlatypus>
	elements := aListOfString
]

{ #category : #'explicit attributes' }
LwsCompoundName >> elementsDefaultValue [
	<MSEProperty: #elements type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]

{ #category : #'initialize-release' }
LwsCompoundName >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'where rules' }
LwsCompoundName >> mustHaveAtLeastOneElement [
	<generatedByPlatypus>
	^ self elements size >= 1
]

{ #category : #'derived attributes' }
LwsCompoundName >> name [
	<MSEProperty: #name type: #String>
	<derived>
	<generatedByPlatypus>
	^ self elements first
]

{ #category : #'derived attributes' }
LwsCompoundName >> suffixes [
	<MSEProperty: #suffixes type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ self elements allButFirst
]
