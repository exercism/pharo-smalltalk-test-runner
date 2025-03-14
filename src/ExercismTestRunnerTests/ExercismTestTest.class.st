Class {
	#name : #ExercismTestTest,
	#superclass : #TestCase,
	#instVars : [
		'mockTestClass'
	],
	#category : #ExercismTestRunnerTests
}

{ #category : #running }
ExercismTestTest >> setUp [
	
	| testRunnerTest |
	super setUp.
	testRunnerTest := ExercismTestRunnerTest new.

	"prepare mock test case and solution"
	testRunnerTest mockRunnerTestCaseSnapshot install.
	testRunnerTest mockRunnerSolutionSnapshot install.
	mockTestClass := self class environment at: #MockRunnerTest.
]

{ #category : #running }
ExercismTestTest >> tearDown [ 

	|aPackage|
	mockTestClass := nil.
	aPackage := RPackageOrganizer default packageNamed: 'Exercise@MockRunner' ifAbsent: [nil].
	aPackage ifNotNil: [ aPackage removeFromSystem].
	super tearDown
]

{ #category : #tests }
ExercismTestTest >> testExercismTestResultInfo [

	| testResult tcInfo |

	testResult := mockTestClass suite run.
	testResult dispatchResultsIntoHistory.
	
	
	tcInfo := testResult passed anyOne exercismTestResultInfo.
	self assert: tcInfo isDictionary.
	self assert: (tcInfo at: 'status') equals: 'pass'.
	
	tcInfo := testResult failures anyOne exercismTestResultInfo.
	self assert: (tcInfo at: 'status') equals: 'fail'.
	self assert: (tcInfo at: 'message') isNotEmpty.
	self assert: (tcInfo at: 'test_code') isNotEmpty.

	tcInfo := testResult errors anyOne exercismTestResultInfo.
	self assert: (tcInfo at: 'status') equals: 'error'.
	self assert: (tcInfo at: 'message') isNotEmpty.
	self assert: (tcInfo at: 'test_code') isNotEmpty.
]

{ #category : #tests }
ExercismTestTest >> testHumanReadableName [
	
	|exeTest|
	exeTest := ExercismTest new.
	exeTest setTestSelector: #test06_DoesNotDetectNonanagramsWithIdenticalChecksum.
	
	self assert: exeTest humanReadableName equals: 'Does not detect nonanagrams with identical checksum'.
	exeTest setTestSelector: #testAnotherNameGiven.
	self assert: exeTest humanReadableName equals: 'Another name given'.
]

{ #category : #tests }
ExercismTestTest >> testResultDebugInfo [
	
	| mockTestCase |
	mockTestCase := mockTestClass new.
	
	mockTestCase setTestSelector: #testMockMethodA.
	self assert: mockTestCase resultDebugInfo equals: ''. 
	
	mockTestCase setTestSelector: #testMockMethodC.
	"test if stack bottom is present"
	self assert: (mockTestCase resultDebugInfo includesSubstring: 'MockRunnerTest(TestCase)>>performTest').
]

{ #category : #tests }
ExercismTestTest >> testResultMessage [

	| mockTestCase |
	mockTestCase := mockTestClass new.
	
	mockTestCase setTestSelector: #testMockMethodA.
	self assert: mockTestCase resultMessage equals: ''. 
	
	mockTestCase setTestSelector: #testMockMethodC.
	"errors should provide some error message - exception description"
	self assert: mockTestCase resultMessage isNotEmpty.
]

{ #category : #tests }
ExercismTestTest >> testSourceCodeString [
	
	| mockTestCase |
	mockTestCase := mockTestClass new.
	
	mockTestCase setTestSelector: #testMockMethodA.
	self assert: (mockTestCase sourceCodeString includesSubstring:  'testMockMethodA'). 
	"test if linux line endings are used for json output"
	self assert: (mockTestCase sourceCodeString includes:  Character lf). 
]

{ #category : #tests }
ExercismTestTest >> testStatusString [

	| testResult |
	testResult := mockTestClass suite run.
	testResult dispatchResultsIntoHistory.
	
	self assert: testResult passed anyOne statusString equals: 'pass'.
	self assert: testResult failures anyOne statusString equals: 'fail'.
	self assert: testResult errors anyOne statusString equals: 'error'.	
]
