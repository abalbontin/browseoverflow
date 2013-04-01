//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicator.h"

@class Topic;
@class QuestionBuilder;
@class Question;

@protocol StackOverflowManagerDelegate;

extern NSString *StackOverflowManagerError;
enum {
    
    StackOverflowManagerErrorQuestionSearchCode
    
};

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;
@property (strong) QuestionBuilder *questionBuilder;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
- (void)searchingForQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestionsJSON:(NSString *)objectNotation;
- (void)fetchBodyForQuestion:(Question *)question;
- (void)fetchingQuestionBodyFailedWithError:(NSError *)error;

@end

@protocol StackOverflowManagerDelegate <NSObject>

- (void)fetchingQuestionsFailedWithError:(NSError *)error;
- (void)didReceiveQuestions:(NSArray *)questions;

@end