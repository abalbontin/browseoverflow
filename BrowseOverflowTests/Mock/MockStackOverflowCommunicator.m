//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator {
    
    BOOL wasAskedToFetchQuestions;

}

- (void)searchForQuestionsWithTag:(NSString *)tag {
    
    wasAskedToFetchQuestions = YES;
    
}

- (BOOL)wasAskedToFetchQuestions {
    
    return wasAskedToFetchQuestions;
    
}

@end
