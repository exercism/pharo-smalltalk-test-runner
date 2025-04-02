Class {
#name : #ExampleAllPassTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleAllPass'
}

{ #category : 'as yet unclassified' }
ExampleAllPassTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleAllPassTest >> testExampleMethodA [
	self assert: ExampleAllPass new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleAllPassTest >> testExampleMethodB [
	self assert: ExampleAllPass new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleAllPassTest >> testExampleMethodC [
	self assert: ExampleAllPass new exerciseMethodC equals: $C
]
