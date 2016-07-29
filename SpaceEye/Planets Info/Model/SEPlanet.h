//
//  SEPlanet.h
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEPlanet : NSObject

+ (NSArray*) getPlanetsName;

+ (NSDictionary *) getPlanetInfo:(NSString *)planetName;


@end
