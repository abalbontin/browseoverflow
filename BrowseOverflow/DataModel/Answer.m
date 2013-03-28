//
//  Answer.m
//  BrowseOverflow
//
//  Created by MBV15 on 27/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import "Answer.h"

@implementation Answer

- (NSComparisonResult)compare:(Answer *)otherAnswer {
    
    if (self.accepted && !(otherAnswer.accepted)) {
        
        return NSOrderedAscending;
        
    } else if (!self.accepted && otherAnswer.accepted){
    
        return NSOrderedDescending;
    
    }
    
    if (self.score > otherAnswer.score) {
        
        return NSOrderedAscending;
    
    } else if (self.score < otherAnswer.score) {
        
        return NSOrderedDescending;
        
    } else {
        
        return NSOrderedSame;
        
    }

}

@end
