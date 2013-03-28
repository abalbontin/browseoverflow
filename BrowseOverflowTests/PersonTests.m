//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by MBV15 on 27/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "PersonTests.h"
#import "Person.h"

@implementation PersonTests

- (void)setUp {

    self.person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation: @"http://example.com/avatar.png"];
    
}

- (void)tearDown {
    
    self.person = nil;
    
}

- (void)testThatPersonHasTheRightName {
    
    STAssertEqualObjects(self.person.name, @"Graham Lee", @"expecting a person to provide its name");
    
}

- (void)testThatPersonHasAnAvatarURL {
 
    NSURL *url = self.person.avatarURL;
    STAssertEqualObjects([url absoluteString], @"http://example.com/avatar.png", @"The Person’s avatar should be represented by a URL");
    
}

@end
