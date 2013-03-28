//
//  Topic.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic

// Metodo que inicializa un Topic con un nombre y un tag.
- (id)initWithName:(NSString *)newName tag:(NSString *)newTag {
    
    if ((self = [super init])) {
    
        _name = [newName copy];
        _tag = [newTag copy];
        _questions = [[NSArray alloc] init];
        
    }
    
    return self;

}

// Metodoq que devuelve las 20 Question mas recientes de un Topic.
- (NSArray *)recentQuestions {
    
    return [self sortQuestionsLatestFirst:self.questions];
    
}

- (void)addQuestion:(Question *)question {
        
    NSArray *newQuestions = [self.questions arrayByAddingObject:question];
    
    if ([newQuestions count] > 20) {
        
        newQuestions = [self sortQuestionsLatestFirst:newQuestions];
        
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
        
    }
    
    self.questions = newQuestions;
    
}

- (NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList {
    
    return [questionList sortedArrayUsingComparator:^(id obj1, id obj2) {
        
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        
        return [q2.date compare: q1.date];
        
    }];

}

@end
