//
//  MockStackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManager.h"

@interface MockStackOverflowManagerDelegate : NSObject <StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;
@property (strong) NSArray *receivedQuestions;
@property (strong) Question *bodyQuestion;

@end
