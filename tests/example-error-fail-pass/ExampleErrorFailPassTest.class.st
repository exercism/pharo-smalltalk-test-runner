Class {
#name : #ExampleErrorFailPassTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleErrorFailPass'
}

{ #category : #'as yet unclassified' }
ExampleErrorFailPassTest >> testExerciseMethodA [
	self assert: ExampleErrorFailPass new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleErrorFailPassTest >> testExerciseMethodB [
	self assert: ExampleErrorFailPass new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleErrorFailPassTest >> testExerciseMethodC [
	self assert: ExampleErrorFailPass new exerciseMethodC equals: $C
]
