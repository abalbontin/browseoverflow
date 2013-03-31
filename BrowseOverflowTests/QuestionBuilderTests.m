//
//  QuestionBuilderTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 31/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "QuestionBuilderTests.h"
#import "QuestionBuilder.h"

@implementation QuestionBuilderTests {
    
    QuestionBuilder *questionBuilder;
    
}

- (void)setUp {
    
    questionBuilder = [[QuestionBuilder alloc] init];
    
}

- (void)tearDown {
    
    questionBuilder = nil;
    
}

@end
