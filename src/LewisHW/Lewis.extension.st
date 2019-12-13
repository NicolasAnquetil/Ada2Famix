Extension { #name : #Lewis }

{ #category : #'*LewisHW' }
Lewis class >> generateLewisGraph [
	"self generateLewisGraph"
	| s f d |
	s := String
		streamContents: [ :strm | 
			strm nextPutAll: '@startuml'.
			strm cr.
			LwsEntity
				allSubclassesDo: [ :cls | 
					strm nextPutAll: cls superclass name.
					strm nextPutAll: ' <|-- '.
					strm nextPutAll: cls name.
					strm cr ].
			strm cr.
			LwsEntity
				allSubclassesDo: [ :cls | 
					cls instVarNames notEmpty
						ifTrue: [ 
							cls instVarNames
								do: [ :n | 
									strm nextPutAll: cls name.
									strm nextPutAll: ' : '.
									strm nextPutAll: n ]
								separatedBy: [ strm cr ].
							strm cr ] ].
			strm nextPutAll: 'hide circle'.
			strm cr.
			strm nextPutAll: 'hide method'.
			strm cr.
			strm nextPutAll: '@enduml'.
			strm cr ].
	f := StandardFileStream forceNewFileNamed: 'LewisHierarchyWithInstVars.txt'.
	f nextPutAll: s.
	f close.
	s := String
		streamContents: [ :strm | 
			strm nextPutAll: '@startuml'.
			strm cr.
			LwsEntity
				allSubclassesDo: [ :cls | 
					strm nextPutAll: cls superclass name.
					strm nextPutAll: ' <|-- '.
					strm nextPutAll: cls name.
					strm cr ].
			strm cr.
			strm nextPutAll: 'hide circle'.
			strm cr.
			strm nextPutAll: 'hide method'.
			strm cr.
			strm nextPutAll: '@enduml'.
			strm cr ].
	f := StandardFileStream forceNewFileNamed: 'LewisHierarchy.txt'.
	f nextPutAll: s.
	f close.
	d := Dictionary new.
	LwsEntity
		allSubclassesDo: [ :cls | 
			| pkgname |
			pkgname := (PackageOrganizer default mostSpecificPackageOfClass: cls) packageName.
			s := d at: pkgname ifAbsentPut: Set new.
			s add: cls ].
	s := String
		streamContents: [ :strm | 
			strm nextPutAll: '@startuml'.
			strm cr.
			d
				keysAndValuesDo: [ :k :v | 
					strm nextPutAll: 'package "' , k , '"'.
					strm cr.
					v
						do: [ :cls | 
							strm nextPutAll: String tab , cls superclass name.
							strm nextPutAll: ' <|-- '.
							strm nextPutAll: cls name.
							strm cr ].
					strm nextPutAll: 'end package'.
					strm cr ].
			strm nextPutAll: 'hide circle'.
			strm cr.
			strm nextPutAll: 'hide method'.
			strm cr.
			strm nextPutAll: '@enduml'.
			strm cr ].
	f := StandardFileStream forceNewFileNamed: 'LewisHierarchyByPackage.txt'.
	f nextPutAll: s.
	f close
]

{ #category : #'*LewisHW' }
Lewis class >> initialize [
	self resetSingleton
]
