"
This subclass is used to represent the alias of a package. An alias is refined by a 'renames' clause, e.g.

package my_alias renames package_with_a_very_LONG_name;

The alias instance forwards some of the behavior to the original package (the package that is renamed using the alias) so that all relationships are established with the original package rather than with the alias.
"
Class {
	#name : #ADAPackageAlias,
	#superclass : #ADAPackage,
	#instVars : [
		'originalEntity'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #testing }
ADAPackageAlias class >> annotation [
	<MSEClass: #PackageAlias super: #ADAPackage>
	<package: #ADA>
]

{ #category : #testing }
ADAPackageAlias class >> isAlias [
	^true
]

{ #category : #accessing }
ADAPackageAlias >> functions [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #functions
]

{ #category : #accessing }
ADAPackageAlias >> localVariables [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #localVariables
]

{ #category : #accessing }
ADAPackageAlias >> originalEntity [
	<MSEProperty: #originalEntity type: #ADAPackage>
	<MSEComment: 'The original package renamed by this alias.'>
	self flag: #todo.	"Cyril: A package should not know its aliases?"
	^ originalEntity
]

{ #category : #accessing }
ADAPackageAlias >> originalEntity: anObject [
	originalEntity := anObject
]

{ #category : #accessing }
ADAPackageAlias >> packages [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #packages
]

{ #category : #printing }
ADAPackageAlias >> printOn: aStream [
	super printOn: aStream.
	self originalEntity
		ifNotNil: [ 
			aStream
				nextPutAll: ' => ';
				print: self originalEntity ]
]

{ #category : #accessing }
ADAPackageAlias >> separates [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #separates
]

{ #category : #accessing }
ADAPackageAlias >> tasks [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #tasks
]

{ #category : #accessing }
ADAPackageAlias >> types [
	^ self originalEntity ifNil: [ #() ] ifNotNil: #types
]
