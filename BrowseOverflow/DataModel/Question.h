//
//  Question.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;

@interface Question : NSObject

@property (strong) NSDate *date;
@property NSInteger score;
@property (copy) NSString *title;
@property (readonly) NSArray *answers;
@property NSMutableSet *answerSet;

- (void)addAnswer: (Answer *)answer;

@end
