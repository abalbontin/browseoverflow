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

- (void)setUp {
 
    self.topic = [[Topic alloc] initWithName: @"iPhone" tag: @"iphone"];
    
}

- (void)tearDown {
    
    self.topic = nil;

}

- (void)testThatTopicExists {
    
    STAssertNotNil(self.topic, @"should be able to create a Topic instance");
    
}

- (void)testThatTopicCanBeNamed {
    
    STAssertEqualObjects(self.topic.name, @"iPhone", @"the Topic should have the name I gave it");
    
}

- (void)testThatTopicHasATag {
    
    STAssertEqualObjects(self.topic.tag, @"iphone", @"Topics need to have tags");
    
}

- (void)testForAListOfQuestions {
    
    STAssertTrue([[self.topic recentQuestions] isKindOfClass: [NSArray class]], @"Topics should provide a list of recent questions");

}

@end
