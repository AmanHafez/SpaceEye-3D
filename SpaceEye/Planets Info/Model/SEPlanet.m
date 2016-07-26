//
//  SEPlanet.m
//  SpaceEye
//
//  Created by Aman Hafaz on 7/23/16.
//  Copyright © 2016 Aman Hafaz. All rights reserved.
//

#import "SEPlanet.h"



@implementation SEPlanet


- (void) test {
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SolarSystemData" ofType:@"plist"]];

    
    NSArray * planetskey = [[NSArray alloc] init];
    NSArray * infokey = [[NSArray alloc] init];
    NSArray * values = [[NSArray alloc] init];
    NSDictionary * testing = [[NSDictionary alloc]init];
    
    for(id key in dictRoot)
    {
        planetskey = key;
        infokey = [dictRoot[key] allKeys];
        values = [dictRoot[key] allValues];
        testing = [NSDictionary dictionaryWithObjects:values forKeys:infokey];
       // NSLog(@"%@ = %@", planetskey,testing);
    }
    
    
  /*  NSLog(@"Item 0: %@",[dictRoot valueForKey:@"Item 0"]);
    NSLog(@"Item 1: %@",[dictRoot valueForKey:@"Item 1"]);
    NSLog(@"Item 2: %@",[dictRoot valueForKey:@"Item 2"]);
    NSLog(@"Item 3: %@",[dictRoot valueForKey:@"Item 3"]);
    NSLog(@"Item 4: %@",[dictRoot valueForKey:@"Item 4"]);
    NSLog(@"Item 5: %@",[dictRoot valueForKey:@"Item 5"]);
    NSLog(@"Item 6: %@",[dictRoot valueForKey:@"Item 6"]);
    NSLog(@"Item 7: %@",[dictRoot valueForKey:@"Item 7"]);
    NSLog(@"Item 8: %@",[dictRoot valueForKey:@"Item 8"]);
    NSLog(@"Item 9: %@",[dictRoot valueForKey:@"Item 9"]);*/
  
}
@end
