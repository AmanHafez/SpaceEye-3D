//
//  PlanetInfoViewController.m
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import "PlanetInfoViewController.h"
#import "PlanetsTableViewCell.h"
#import "GameViewController.h"
#import "SEPlanet.h"

@interface PlanetInfoViewController ()<UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIImageView * img;
@property (nonatomic, weak) IBOutlet UITableView * planetInfoTable;
@property (nonatomic,strong) NSArray *planetKey;
@property (nonatomic, strong)NSArray *planetValue;


@end

@implementation PlanetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title =_planetName ;
    self.img.image=   [UIImage imageNamed: _planetName];
    [self loadDataToTable];
 
}




-(void) loadDataToTable {
    _planetKey= [[SEPlanet getPlanetInfo:_planetName] allKeys];
    _planetValue= [[SEPlanet getPlanetInfo:_planetName] allValues];
    
    NSLog(@"%@",_planetKey);
    NSLog(@"%@",_planetValue);
    
    [_planetInfoTable reloadData];
    
}

#pragma mark - table view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _planetKey.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlanetsTableViewCell *planetCell = [tableView dequeueReusableCellWithIdentifier:@"PlanetsInfoTableViewCell"];
    [planetCell setPlanetKey:_planetKey[indexPath.row]];
    [planetCell setPlanetValue:_planetValue[indexPath.row]];
    return planetCell;
}




@end
