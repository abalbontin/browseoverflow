//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *QuestionBuilderErrorDomain;
enum {
    
    QuestionBuilderInvalidJSONError,
    QuestionBuilderMissingDataError
    
};

@interface QuestionBuilder : NSObject

- (NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error;

@end
