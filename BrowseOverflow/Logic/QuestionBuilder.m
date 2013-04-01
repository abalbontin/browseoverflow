//
//  QuestionBuilder.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionBuilder.h"
#import "Question.h"
#import "Person.h"

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
    
    NSMutableArray *questionsToReturn = [NSMutableArray arrayWithCapacity:[questions count]];
    
    for (NSDictionary *questionDictionary in questions) {
        
        Question *question = [[Question alloc] init];
        question.questionID = [[questionDictionary objectForKey:@"question_id"] integerValue];
        question.date = [NSDate dateWithTimeIntervalSince1970:[[questionDictionary objectForKey:@"creation_date"] doubleValue]];
        question.title = [questionDictionary objectForKey:@"title"];
        question.score = [[questionDictionary objectForKey:@"score"] integerValue];
        NSDictionary *ownerDictionary = [questionDictionary objectForKey:@"owner"];
        question.asker = [[Person alloc] initWithName:[ownerDictionary objectForKey:@"display_name"]
                                       avatarLocation:[@"http://www.gravatar.com/avatar/" stringByAppendingString:
                                                       [ownerDictionary objectForKey:@"email_hash"]]];
        
        [questionsToReturn addObject:question];
        
    }
    
    return [questionsToReturn copy];
    
}

@end
