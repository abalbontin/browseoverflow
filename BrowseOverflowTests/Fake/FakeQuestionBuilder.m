//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation FakeQuestionBuilder

- (NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error {
    
    self.JSON = objectNotation;
    if (error) {
    
        *error = self.errorToSet;
    
    }
    
    return self.arrayToReturn;
    
}

- (void)fillInDetailsForQuestion:(Question *)question fromJSON:(NSString *)objectNotation {
    
    self.JSON = objectNotation;
    self.questionToFill = question;
    
}

@end
