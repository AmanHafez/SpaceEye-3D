//
//  PlanetsTableViewCell.m
//  SpaceEye
//
//  Created by Omar Almasri on 7/23/16.
//  Copyright © 2016 OmarRO. All rights reserved.
//

#import "PlanetsTableViewCell.h"

@interface PlanetsTableViewCell()

@property (nonatomic, weak) IBOutlet UILabel * pointName;
@property (nonatomic, weak) IBOutlet UILabel * pointValue;

@end



@implementation PlanetsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPoint:(SEPlanet *)point {
    
    _pointName.text = point.key;
    _pointValue.text = point.value;

}

@end
