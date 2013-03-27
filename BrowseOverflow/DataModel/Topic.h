//
//  Topic.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface Topic : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *tag;
@property NSArray *questions;

// Metodo que inicializa un Topic con un nombre y un tag.
- (id)initWithName:(NSString *)newName tag:(NSString *)newTag;

// Metodoq que devuelve las 20 Question mas recientes de un Topic.
- (NSArray *)recentQuestions;

// Metodo que anyado una Question al Topic.
- (void)addQuestion:(Question *)question;

@end
