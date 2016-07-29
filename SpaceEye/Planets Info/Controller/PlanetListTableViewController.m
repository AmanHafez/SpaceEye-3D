//
//  PlanetListTableViewController.m
//  SpaceEye
//
//  Created by  Aman Hafaz on 7/29/16.
//  Copyright © 2016  Aman Hafaz. All rights reserved.
//

#import "PlanetListTableViewController.h"
#import "PlanetInfoViewController.h"
#import "SEPlanet.h"

@interface PlanetListTableViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *PlanetsName;

@end

@implementation PlanetListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _PlanetsName = [SEPlanet getPlanetsName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)swapBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - table view

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _PlanetsName.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlanetName"];
    cell.textLabel.text = [_PlanetsName objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PlanetInfoViewController *planetInfo = [segue destinationViewController];
    UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:[self.tableView  indexPathForSelectedRow]];
    planetInfo.planetName =   selectedCell.textLabel.text;
}


@end
