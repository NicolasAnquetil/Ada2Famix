Class {
	#name : #LewisTestCase,
	#superclass : #PtsTestCase,
	#category : #'Lewis-Namespace'
}

{ #category : #platypus }
LewisTestCase class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #accessing }
LewisTestCase class >> resources [
	<generatedByPlatypus>
	^ Array with: LewisInlineTestResource with: LewisDirectoryTestResource
]

{ #category : #accessing }
LewisTestCase >> samples [
	<generatedByPlatypus>
	^ LewisInlineTestResource current samples , LewisDirectoryTestResource current samples
]
