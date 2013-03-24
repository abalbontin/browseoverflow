//
//  Topic.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Topic.h"

@implementation Topic

- (id)initWithName:(NSString *)newName {
    
    if ((self = [super init])) {
    
        _name = [newName copy];
    
    }
    
    return self;

}

@end
