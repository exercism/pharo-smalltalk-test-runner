Class {
	#name : 'ExampleAllFailTest',
	#superclass : 'ExercismTest',
	#category : 'Exercise@ExampleAllFail',
	#package : 'Exercise@ExampleAllFail'
}

{ #category : 'private' }
ExampleAllFailTest class >> exampleSolutionSourceCode [ 

	^ 'Class {
	#name : #ExampleAllFail,
	#superclass : #Object,
	#category : #''Exercise@ExampleAllFail''
}

{ #category : #''as yet unclassified'' }
ExampleAllFail >> exerciseMethodA [
	^ ''not $A''
]

{ #category : #''as yet unclassified'' }
ExampleAllFail >> exerciseMethodB [
	^ ''not $B''
]

{ #category : #''as yet unclassified'' }
ExampleAllFail >> exerciseMethodC [
	^ ''not $C''
]
'
]

{ #category : 'private' }
ExampleAllFailTest class >> exampleTestCasesSourceCode [ 
	
	^ 'Class {
	#name : #ExampleAllFailTest,
	#superclass : #ExercismTest,
	#category : #''Exercise@ExampleAllFail''
}

{ #category : #''as yet unclassified'' }
ExampleAllFailTest >> testExerciseMethodA [
	self assert: ExampleAllFail new exerciseMethodA equals: $A
]

{ #category : #''as yet unclassified'' }
ExampleAllFailTest >> testExerciseMethodB [
	self assert: ExampleAllFail new exerciseMethodB equals: $B
]

{ #category : #''as yet unclassified'' }
ExampleAllFailTest >> testExerciseMethodC [
	self assert: ExampleAllFail new exerciseMethodC equals: $C
]
'
]
