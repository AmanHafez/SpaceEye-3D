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

@interface PlanetInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UIImageView * img;
@property (nonatomic, weak) IBOutlet UITableView * planetInfoTable;
@property (nonatomic,strong)NSArray *planetInfo;


@end

@implementation PlanetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Planets Informations";
    _img.image =[UIImage imageNamed:@"Earth"];
 
}

- (void) loadData {
    
}
- (IBAction)swapBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

//    GameViewController *planetOrbit = planetOrbit = [self.storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
//
//    [self presentViewController:planetOrbit animated:YES completion:nil];
    

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
