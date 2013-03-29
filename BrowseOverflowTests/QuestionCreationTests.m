//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionCreationTests.h"
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "MockStackOverflowCommunicator.h"
#import "Topic.h"

@implementation QuestionCreationTests {

@private
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;

}

- (void)setUp {
    
    mgr = [[StackOverflowManager alloc] init];
    
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    underlyingError = [NSError errorWithDomain:@"Test domain" code:0 userInfo:nil];
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    
}

- (void)tearDown {
    
    mgr = nil;
    
}

- (void)testNonConformingObjectCannotBeDelegate {
    
    STAssertThrows(mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null],
                   @"NSNull should not be used as the delegate as doesn't conform to the delegate protocol");
    
}

- (void)testManagerAcceptsNilAsADelegate {
    
    STAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use nil as an object’s delegate");
    
}

- (void)testConformingObjectCanBeDelegate {
    
    STAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as the delegate");
    
}

- (void)testAskingForQuestionsMeansRequestingData {
    
    MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc] init];
    mgr.communicator = communicator;
    
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iphone"];
    [mgr fetchQuestionsOnTopic:topic];
    
    STAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator should need to fetch data.");
    
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
    
    STAssertFalse(underlyingError == [delegate fetchError], @"Error should be at the correct level of abstraction");
    
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError {
    
    STAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError,
                         @"The underlying error should be available to client code");
    
}

@end
