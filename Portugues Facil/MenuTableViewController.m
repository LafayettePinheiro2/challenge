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
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone]; //Retira cell sem conteúdo
    
    
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
    NSString *cellIdentifier = @"menuCell";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    cell.middleLabel.text = [self.menu objectAtIndex:indexPath.row];
    cell.leftLabel.text = [self.menu objectAtIndex:indexPath.row];
    cell.rightLabel.text = [self.menu objectAtIndex:indexPath.row];
    
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height - 1, cell.frame.size.width, 1)];
    [separatorView setBackgroundColor:[UIColor lightGrayColor]];
    [separatorView setAlpha:0.8f];
    [cell addSubview:separatorView];
    
    NSIndexPath *topIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:topIndexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [self.detailViewController updateDetail:@"Menu value"];
    //    [self.navigationController pushViewController:telaSimulado animated:YES];
    
    UIViewController *viewDetail = nil;
    
    switch (indexPath.row) {
        case 0:
            viewDetail = [[DetailViewController alloc] init];
            break;
        case 1:
            viewDetail = [[SimuladoViewController alloc] init];
            break;
        default:
            break;
    }
    
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:self.navigationController, viewDetail, nil];
    self.splitViewController.viewControllers = viewControllers;
}

@end
