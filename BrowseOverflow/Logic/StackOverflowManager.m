//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "StackOverflowManager.h"
#import "Topic.h"
#import "QuestionBuilder.h"

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

@implementation StackOverflowManager

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    
    if (newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        
        [[NSException exceptionWithName: NSInvalidArgumentException reason:@"Delegate object does not conform to the delegate protocol"
                               userInfo: nil] raise];
        
    }
    
    _delegate = newDelegate;

}

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    
    [self.communicator searchForQuestionsWithTag:[topic tag]];
    
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    
    [self.delegate fetchingQuestionsFailedWithError:reportableError];
    
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
 
    NSArray *questions = [self.questionBuilder questionsFromJSON:objectNotation error:NULL];
    
}

@end