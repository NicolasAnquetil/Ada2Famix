"
An ADAGenericPackageInsatnciation is aa Ada package that is an instanciation of a generic package

It use the scope of the generic to resolve names
"
Class {
	#name : #ADAGenericPackageInstanciation,
	#superclass : #ADAPackage,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAGenericPackageInstanciation class >> annotation [
	<MSEClass: #GenericPackageInstanciation super: #ADAPackage>
	<package: #ADA>
]

{ #category : #accessing }
ADAGenericPackageInstanciation >> fastScope: aScope [
	"the scope should be the one of the instanciated generic and should not be changed"
	self shouldNotImplement 
]
