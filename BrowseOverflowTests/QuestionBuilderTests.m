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

- (void)testThatNilIsNotAnAcceptableParameter {
    
    STAssertThrows([questionBuilder questionsFromJSON:nil error:NULL], @"Lack of data should have been handled elsewhere");
    
}

- (void)testNilReturnedWhenStringIsNotJSON {
    
    STAssertNil([questionBuilder questionsFromJSON:@"Not JSON" error:NULL], @"This parameter should not be parsable");
    
}

- (void)testErrorSetWhenStringIsNotJSON {
    
    NSError *error = nil;
    [questionBuilder questionsFromJSON:@"Not JSON" error:&error];
    STAssertNotNil(error, @"An error occurred, we should be told");
    
}

- (void)testPassingNullErrorDoesNotCauseCrash {
    
    STAssertNoThrow([questionBuilder questionsFromJSON:@"Not JSON" error:NULL], @"Using a NULL error parameter should not be a problem");
    
}

@end
