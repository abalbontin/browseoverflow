//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "TopicTests.h"
#import "Topic.h"

@implementation TopicTests

- (void)testThatTopicExists {
    
    Topic *newTopic = [[Topic alloc] init];
    STAssertNotNil(newTopic, @"should be able to create a Topic instance");
    
}

- (void)testThatTopicCanBeNamed {
    
    Topic *namedTopic = [[Topic alloc] initWithName: @"iPhone"];
    STAssertEqualObjects(namedTopic.name, @"iPhone", @"the Topic should have the name I gave it");
    
}

@end
