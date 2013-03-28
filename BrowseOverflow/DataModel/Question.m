//
//  Question.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 26/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question

- (id)init {
    
    if ((self = [super init])) {
    
        self.answerSet = [[NSMutableSet alloc] init];
    
    }
    
    return self;

}

- (void)addAnswer:(Answer *)answer {
    
    [self.answerSet addObject:answer];

}

- (NSArray *)answers {
    
    return [[self.answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
    
}

@end
