Class {
	#name : #ExampleAllFailTest,
	#superclass : #ExercismTest,
	#category : #'Exercise@ExampleAllFail'
}

{ #category : 'as yet unclassified' }
ExampleAllFailTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleAllFailTest >> testExerciseMethodA [
	self assert: ExampleAllFail new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleAllFailTest >> testExerciseMethodB [
	self assert: ExampleAllFail new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleAllFailTest >> testExerciseMethodC [
	self assert: ExampleAllFail new exerciseMethodC equals: $C
]
