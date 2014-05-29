//
//  MenuTableViewController.m
//  Portugues Facil
//
//  Created by Yoshiharu Takuno on 29/05/14.
//  Copyright (c) 2014 Lafayette Pinheiro. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@property (nonatomic, strong) NSArray *menu;

@end

@implementation MenuTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Menu";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menu = @[@"Home", @"Simulado"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.menu objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.detailViewController updateDetail:@"Menu value"];
}

@end
