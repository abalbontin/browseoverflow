//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionTests.h"
#import "Question.h"

@implementation QuestionTests

- (void)setUp {
    
    self.question = [[Question alloc] init];
    self.question.date = [NSDate distantPast];
    self.question.title = @"Do iPhones also dream of electric sheep?";
    self.question.score = 42;
    
}

- (void)tearDown {
    
    self.question = nil;

}

- (void)testQuestionHasADate {
    
    NSDate *testDate = [NSDate distantPast];
    self.question.date = testDate;
    
    STAssertEqualObjects(self.question.date, testDate, @"Question needs to provide its date");
    
}

- (void)testQuestionsKeepScore {
    
    STAssertEquals(self.question.score, 42, @"Questions need a numeric score");
    
}

- (void)testQuestionHasATitle {
    
    STAssertEqualObjects(self.question.title, @"Do iPhones also dream of electric sheep?", @"Question should know its title");
    
}

@end
