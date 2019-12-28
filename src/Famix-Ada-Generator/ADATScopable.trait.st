"
Models the fact that a FamixEntity may have a FASTScope for name resolution (see FAST-Core-Resolution)

This might change as FASTScope are not yet part of FamixNG (yet again, it might not chnage for a long time))
"
Trait {
	#name : #ADATScopable,
	#instVars : [
		'fastScope'
	],
	#category : #'Famix-Ada-Generator-predefinedFamix'
}

{ #category : #meta }
ADATScopable classSide >> annotation [

	<MSEClass: #TScopable super: #Trait>
	<generated>
	<package: #'Famix-Ada'>
	^self
]

{ #category : #generator }
ADATScopable classSide >> generatedSlotNames [
	<generated>
	'ADATScopable class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
ADATScopable classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
ADATScopable >> classOfMyScope [
	^ FASTAdaContainerScope
]

{ #category : #accessing }
ADATScopable >> fastScope [
	^ fastScope ifNil: [self initScope]
]

{ #category : #accessing }
ADATScopable >> fastScope: aScope [
	fastScope := aScope
]

{ #category : #accessing }
ADATScopable >> hasScope [
	^ true
]

{ #category : #accessing }
ADATScopable >> initScope [
	self fastScope: (self classOfMyScope newWithOwner: self).
	^ self fastScope
]
