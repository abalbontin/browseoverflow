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

@protocol StackOverflowManagerDelegate;

extern NSString *StackOverflowManagerError;
enum {
    
    StackOverflowManagerErrorQuestionSearchCode
    
};

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;

- (void)searchingForQuestionsFailedWithError:(NSError *)error;

@end

@protocol StackOverflowManagerDelegate <NSObject>

- (void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error;

@end