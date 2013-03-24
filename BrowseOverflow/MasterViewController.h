//
//  MasterViewController.h
//  BrowseOverflow
//
//  Created by Álvaro Balbontín Gutiérrez on 24/03/13.
//  Copyright (c) 2013 Álvaro Balbontín Gutiérrez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
