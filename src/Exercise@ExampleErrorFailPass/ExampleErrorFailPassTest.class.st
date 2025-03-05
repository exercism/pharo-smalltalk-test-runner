Class {
	#name : 'ExampleErrorFailPassTest',
	#superclass : 'ExercismTest',
	#category : 'Exercise@ExampleErrorFailPass',
	#package : 'Exercise@ExampleErrorFailPass'
}

{ #category : 'private' }
ExampleErrorFailPassTest class >> exampleSolutionSourceCode [ 

	^ 'Class {
	#name : #ExampleErrorFailPass,
	#superclass : #Object,
	#category : #''Exercise@ExampleErrorFailPass''
}

{ #category : #''as yet unclassified'' }
ExampleErrorFailPass >> exerciseMethodA [
	^ self error: ''Error occured in method A''
]

{ #category : #''as yet unclassified'' }
ExampleErrorFailPass >> exerciseMethodB [
	^ ''not $B''
]

{ #category : #''as yet unclassified'' }
ExampleErrorFailPass >> exerciseMethodC [
	^ $C
]
'
]

{ #category : 'private' }
ExampleErrorFailPassTest class >> exampleTestCasesSourceCode [
	
	^ 'Class {
#name : #ExampleErrorFailPassTest,
#superclass : #ExercismTest,
#category : #''Exercise@ExampleErrorFailPass''
}

{ #category : #''as yet unclassified'' }
ExampleErrorFailPassTest >> testExerciseMethodA [
	self assert: ExampleErrorFailPass new exerciseMethodA equals: $A
]

{ #category : #''as yet unclassified'' }
ExampleErrorFailPassTest >> testExerciseMethodB [
	self assert: ExampleErrorFailPass new exerciseMethodB equals: $B
]

{ #category : #''as yet unclassified'' }
ExampleErrorFailPassTest >> testExerciseMethodC [
	self assert: ExampleErrorFailPass new exerciseMethodC equals: $C
]
'
]
