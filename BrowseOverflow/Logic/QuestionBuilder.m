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
    
    NSData *unicodeNotation = [objectNotation dataUsingEncoding:NSUTF8StringEncoding];
    NSError *localError = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:unicodeNotation options:0 error:&localError];
    
    NSDictionary *parsedObject = (id)jsonObject;
    
    if (parsedObject == nil) {
        
        if (error != NULL) {
        
            NSDictionary *errorInfo = nil;
            if (localError) {
                
                errorInfo = [NSDictionary dictionaryWithObject:localError forKey:NSUnderlyingErrorKey];
                
            }
            
            *error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderInvalidJSONError userInfo:errorInfo];
            
        }
        
        return nil;
    
    }
    
    NSArray *questions = [parsedObject objectForKey:@"questions"];
    
    if (questions == nil) {
    
        if (error != NULL) {
            
            *error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderMissingDataError userInfo:nil];
            
        }
        
        return nil;
        
    }
    
    return questions;
    
}

@end
