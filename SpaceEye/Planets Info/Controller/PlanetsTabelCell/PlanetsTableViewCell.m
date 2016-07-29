//
//  PlanetsTableViewCell.m
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import "PlanetsTableViewCell.h"

@interface PlanetsTableViewCell()

@property (nonatomic, weak) IBOutlet UILabel * pointName;
@property (nonatomic, weak) IBOutlet UILabel * pointValue;

@end



@implementation PlanetsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setPlanetKey:(NSString *)key {
    _pointName.text = key;
}
- (void)setPlanetValue:(NSString *)value {
    _pointValue.text = value;
}
@end
