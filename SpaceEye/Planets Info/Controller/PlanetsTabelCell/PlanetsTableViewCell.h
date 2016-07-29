//
//  PlanetsTableViewCell.h
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEPlanet.h"
@interface PlanetsTableViewCell : UITableViewCell

- (void)setPlanetValue:(NSString *)value;
- (void)setPlanetKey:(NSString *)key;

@end
