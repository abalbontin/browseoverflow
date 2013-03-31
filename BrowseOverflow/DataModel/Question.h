//
//  Question.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Answer;
@class Person;

@interface Question : NSObject

@property (strong) NSDate *date;
@property NSInteger score;
@property (copy) NSString *title;
@property (readonly) NSArray *answers;
@property NSMutableSet *answerSet;
@property NSInteger questionID;
@property Person *asker;

- (void)addAnswer: (Answer *)answer;

@end
