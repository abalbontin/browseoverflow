//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 29/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate

#pragma mark - Metodos del protocolo StackOverflowManagerDelegate

- (void)fetchingQuestionsFailedWithError:(NSError *)error {
    
    self.fetchError = error;
    
}

- (void)didReceiveQuestions:(NSArray *)questions {
    
    self.receivedQuestions = questions;
    
}

@end
