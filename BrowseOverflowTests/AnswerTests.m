//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by MBV15 on 27/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "AnswerTests.h"
#import "Answer.h"
#import "Person.h"

@implementation AnswerTests

- (void)setUp {
 
    self.answer = [[Answer alloc] init];
    self.answer.text = @"The answer is 42";
    self.answer.person = [[Person alloc] initWithName: @"Graham Lee" avatarLocation: @"http://example.com/avatar.png"];
    self.answer.score = 42;
    
    self.otherAnswer = [[Answer alloc] init];
    self.otherAnswer.text = @"I have the answer you need";
    self.otherAnswer.score = 42;
    
}

- (void)tearDown {
    
    self.answer = nil;
    
}

- (void)testAnswerHasSomeText {
    
    STAssertEqualObjects(self.answer.text, @"The answer is 42", @"Answers need to contain some text");
    
}

- (void)testSomeoneProvidedTheAnswer {
    
    STAssertTrue([self.answer.person isKindOfClass:[Person class]], @"A Person gave this Answer");
    
}

- (void)testAnswersNotAcceptedByDefault {
    
    STAssertFalse(self.answer.accepted, @"Answer not accepted by default");
    
}

- (void)testAnswerCanBeAccepted {
 
    STAssertNoThrow(self.answer.accepted = YES, @"It is possible to accept an answer");
    
}

- (void)testAnswerHasAScore {
    
    STAssertTrue(self.answer.score == 42, @"Answer's score can be retrieved");
    
}

- (void)testAcceptedAnswerComesBeforeUnaccepted {
    
    self.otherAnswer.accepted = YES;
    self.otherAnswer.score = self.answer.score + 10;
    
    STAssertEquals([self.answer compare:self.otherAnswer], NSOrderedDescending, @"Accepted answer should come first");
    STAssertEquals([self.otherAnswer compare:self.answer], NSOrderedAscending, @"Unaccepted answer should come last");
    
}

- (void)testAnswersWithEqualScoresCompareEqually {
    
    STAssertEquals([self.answer compare:self.otherAnswer], NSOrderedSame, @"Both answers of equal rank");
    STAssertEquals([self.otherAnswer compare:self.answer], NSOrderedSame, @"Each answer has the same rank");
    
}

- (void)testLowerScoringAnswerComesAfterHigher {
    
    self.otherAnswer.score = self.answer.score + 10;
    
    STAssertEquals([self.answer compare:self.otherAnswer], NSOrderedDescending, @"Higher score comes first");
    STAssertEquals([self.otherAnswer compare:self.answer], NSOrderedAscending, @"Lower score comes last");
    
}

@end
