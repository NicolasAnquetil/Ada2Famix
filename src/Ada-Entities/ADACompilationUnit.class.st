"
Class for a special container that represents a single compilation unit, i.e. an input file
"
Class {
	#name : #ADACompilationUnit,
	#superclass : #ADAContainerEntity,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADACompilationUnit class >> annotation [
	<MSEClass: #CompilationUnit super: #ADAContainerEntity>
	<package: #ADA>
]

{ #category : #display }
ADACompilationUnit >> mooseNameSeparator [
	^ '=>'
]
