//
//  PlanetInfoViewController.m
//  SpaceEye
//
//  Created by Omar Almasri on 7/23/16.
//  Copyright © 2016 OmarRO. All rights reserved.
//

#import "PlanetInfoViewController.h"
#import "PlanetsTableViewCell.h"
#import "SEPlanet.h"

@interface PlanetInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIImageView * img;
@property (nonatomic, weak) IBOutlet UITableView * planetInfoTable;
@property (nonatomic,strong)NSArray *planetInfo;



@end

@implementation PlanetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) loadData {
    
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _planetInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlanetsTableViewCell *planetCell = [tableView dequeueReusableCellWithIdentifier:@"PlanetsTableViewCell"];
    [planetCell setPoint:_planetInfo[indexPath.row]];
    return planetCell;
}


@end
