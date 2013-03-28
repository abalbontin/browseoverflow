//
//  Person.m
//  BrowseOverflow
//
//  Created by MBV15 on 27/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithName:(NSString *)aName avatarLocation:(NSString *)location {
    
    if ((self = [super init])) {
        
        _name = [aName copy];
        _avatarURL = [[NSURL alloc] initWithString:location];
        
    }
    
    return self;
        
}

@end
