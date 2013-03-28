//
//  Answer.h
//  BrowseOverflow
//
//  Created by MBV15 on 27/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property NSString *text;
@property Person *person;
@property (getter=isAccepted) BOOL accepted;
@property NSInteger score;

- (NSComparisonResult)compare:(Answer *)otherAnswer;

@end
