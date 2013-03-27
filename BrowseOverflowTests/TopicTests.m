//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "TopicTests.h"
#import "Topic.h"
#import "Question.h"

@implementation TopicTests

- (void)setUp {
 
    self.topic = [[Topic alloc] initWithName: @"iPhone" tag: @"iphone"];
    
}

- (void)tearDown {
    
    self.topic = nil;

}

- (void)testThatTopicExists {
    
    STAssertNotNil(self.topic, @"should be able to create a Topic instance");
    
}

- (void)testThatTopicCanBeNamed {
    
    STAssertEqualObjects(self.topic.name, @"iPhone", @"the Topic should have the name I gave it");
    
}

- (void)testThatTopicHasATag {
    
    STAssertEqualObjects(self.topic.tag, @"iphone", @"Topics need to have tags");
    
}

- (void)testForAListOfQuestions {
    
    STAssertTrue([[self.topic recentQuestions] isKindOfClass: [NSArray class]], @"Topics should provide a list of recent questions");

}

- (void)testForInitiallyEmptyQuestionList {
    
    STAssertEquals([[self.topic recentQuestions] count], (NSUInteger)0, @"No questions added yet, count should be zero");
    
}

- (void)testAddingAQuestionToTheList {
    
    Question *question = [[Question alloc] init];
    
    [self.topic addQuestion:question];
    
    STAssertEquals([[self.topic recentQuestions] count], (NSUInteger)1, @"Add a question, and the count of questions should go up");
    
}

- (void)testQuestionsAreListedChronologically {
    
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantFuture];
    
    [self.topic addQuestion:q1];
    [self.topic addQuestion:q2];
    
    NSArray *questions = [self.topic recentQuestions];
    Question *listedFirst = [questions objectAtIndex:0];
    Question *listedSecond = [questions objectAtIndex:1];
    
    STAssertEqualObjects([listedFirst.date laterDate: listedSecond.date], listedFirst.date,
                         @"The later question should appear first in the list");
    
}

- (void)testLimitOfTwentyQuestions {
    
    Question *q1 = [[Question alloc] init];
    for (NSInteger i = 0; i < 25; i++) {
    
        [self.topic addQuestion:q1];
    
    }
    
    STAssertTrue([[self.topic recentQuestions] count] < 21, @"There should never be more than twenty questions");
    
}

@end
