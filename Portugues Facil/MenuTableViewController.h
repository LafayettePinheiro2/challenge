//
//  MenuTableViewController.h
//  Portugues Facil
//
//  Created by Yoshiharu Takuno on 29/05/14.
//  Copyright (c) 2014 Lafayette Pinheiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "MenuCell.h"
#import "SimuladoViewController.h"

@protocol SubstitutableDetailViewController
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
@end

@interface MenuTableViewController : UITableViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
