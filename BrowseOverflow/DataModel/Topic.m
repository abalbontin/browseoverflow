//
//  Topic.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Topic.h"

@implementation Topic

// Metodo que inicializa un Topic con un nombre y un tag.
- (id)initWithName:(NSString *)newName tag:(NSString *)newTag {
    
    if ((self = [super init])) {
    
        _name = [newName copy];
        _tag = [newTag copy];
        
    }
    
    return self;

}

// Metodoq que devuelve las 20 Question mas recientes de un Topic.
- (NSArray *)recentQuestions {
    
    return [NSArray array];
    
}

@end
