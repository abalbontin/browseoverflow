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
#import "Question.h"

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

@interface StackOverflowManager (Private)

- (void)tellDelegateAboutQuestionSearchError:(NSError *)underlyingError;

@end

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
    
    [self tellDelegateAboutQuestionSearchError:error];
    
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
    
    NSError *error = nil;
    NSArray *questions = [self.questionBuilder questionsFromJSON:objectNotation error:&error];
    
    if (!questions) {
    
        [self tellDelegateAboutQuestionSearchError:error];
        
    } else {
     
        [self.delegate didReceiveQuestions:questions];
        
    }
    
}

- (void)tellDelegateAboutQuestionSearchError:(NSError *)underlyingError {
    
    NSDictionary *errorInfo = nil;
    if (underlyingError) {
        
        errorInfo = [NSDictionary dictionaryWithObject:underlyingError forKey:NSUnderlyingErrorKey];
        
    }
    
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    
    [self.delegate fetchingQuestionsFailedWithError:reportableError];
    
}

- (void)fetchBodyForQuestion:(Question *)question {
    
    [self.communicator searchForBodyWithQuestionID:question.questionID];
    
}

@end