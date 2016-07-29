//
//  SEPlanet.m
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import "SEPlanet.h"



@implementation SEPlanet


+ (NSArray *) getPlanetsName {
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SolarSystemData" ofType:@"plist"]];
    NSArray *planetsName = [dictRoot allKeys];
    return planetsName;
}


+ (NSDictionary *) getPlanetInfo:(NSString *)planetName {
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SolarSystemData" ofType:@"plist"]];
    NSDictionary *planet = [dictRoot objectForKey:planetName];
    return planet;
}



@end
