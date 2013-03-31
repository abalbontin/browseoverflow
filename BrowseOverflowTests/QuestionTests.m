//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionTests.h"
#import "Question.h"
#import "Answer.h"
#import "Person.h"

@implementation QuestionTests

- (void)setUp {
    
    self.question = [[Question alloc] init];
    self.question.date = [NSDate distantPast];
    self.question.title = @"Do iPhones also dream of electric sheep?";
    self.question.score = 42;
    self.question.questionID = 17;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [self.question addAnswer:accepted];
    
    self.lowScore = [[Answer alloc] init];
    self.lowScore.score = -4;
    [self.question addAnswer:self.lowScore];
    
    self.highScore = [[Answer alloc] init];
    self.highScore.score = 4;
    [self.question addAnswer:self.highScore];

    self.asker = [[Person alloc] initWithName: @"Graham Lee" avatarLocation:@"http://example.com/avatar.png"];
    self.question.asker = self.asker;
    
}

- (void)tearDown {
    
    self.question = nil;
    self.lowScore = nil;
    self.highScore = nil;
    self.asker = nil;
    
}

- (void)testQuestionHasADate {
    
    STAssertEqualObjects(self.question.date, [NSDate distantPast], @"Question needs to provide its date");
    
}

- (void)testQuestionsKeepScore {
    
    STAssertEquals(self.question.score, 42, @"Questions need a numeric score");
    
}

- (void)testQuestionHasATitle {
    
    STAssertEqualObjects(self.question.title, @"Do iPhones also dream of electric sheep?", @"Question should know its title");
    
}

- (void)testQuestionCanHaveAnswersAdded {
    
    Answer *myAnswer = [[Answer alloc] init];
    
    STAssertNoThrow([self.question addAnswer:myAnswer], @"Must be able to add answers");
    
}

- (void)testAcceptedAnswerIsFirst {
    
    STAssertTrue([[self.question.answers objectAtIndex: 0] isAccepted], @"Accepted answer comes first");
    
}

- (void)testQuestionsHasIdentity {
    
    STAssertEquals(self.question.questionID, 17, @"Questions need a numeric identifier");
    
}

- (void)testHighScoreAnswerBeforeLow {
    
    NSArray *answers = self.question.answers;
    NSInteger highIndex = [answers indexOfObject:self.highScore];
    NSInteger lowIndex = [answers indexOfObject:self.lowScore];
    
    STAssertTrue(highIndex < lowIndex, @"High-scoring answer comes first");

}

- (void)testQuestionWasAskedBySomeone {
    
    STAssertEqualObjects(self.question.asker, self.asker, @"Question should keep track of who asked it.");
    
}

@end
