//
//  QuestionBuilder.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionBuilder.h"

NSString *QuestionBuilderErrorDomain = @"QuestionBuilderErrorDomain";

@implementation QuestionBuilder

- (NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error {
    
    NSParameterAssert(objectNotation != nil);
    
    if (error != NULL) {
    
        *error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderInvalidJSONError userInfo:nil];
        
    }
    
    return nil;

}

@end
