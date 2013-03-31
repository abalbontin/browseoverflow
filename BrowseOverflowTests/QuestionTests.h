//
//  QuestionTests.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class Question;
@class Answer;
@class Person;

@interface QuestionTests : SenTestCase
    
@property Question *question;
@property Answer *lowScore;
@property Answer *highScore;
@property Person *asker;

@end
