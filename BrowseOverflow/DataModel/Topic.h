//
//  Topic.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

// Metodo que inicializa un Topic con un nombre y un tag.
- (id)initWithName:(NSString *)newName tag:(NSString *)newTag;

// Metodoq que devuelve las 20 Question mas recientes de un Topic.
- (NSArray *)recentQuestions;

@end
