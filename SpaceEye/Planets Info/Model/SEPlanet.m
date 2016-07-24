//
//  SEPlanet.m
//  SpaceEye
//
//  Created by Omar Almasri on 7/23/16.
//  Copyright © 2016 OmarRO. All rights reserved.
//

#import "SEPlanet.h"



@implementation SEPlanet


- (void) test {
    
//    NSString *paths = [[NSBundle mainBundle] pathForResource:@"SolarSystemData" ofType:@"plist"];
//    NSDictionary *navigationItems = [[NSMutableDictionary alloc] initWithContentsOfFile:paths];
    
    NSDictionary *dictRoot = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SolarSystemData" ofType:@"plist"]];

    NSMutableArray * proveMe =[dictRoot valueForKey:@"Item 0"];
    NSLog(@"%@",proveMe);
    NSLog(@"Item 0: %@",[dictRoot valueForKey:@"Item 0"]);
    NSLog(@"Item 1: %@",[dictRoot valueForKey:@"Item 1"]);
    NSLog(@"Item 2: %@",[dictRoot valueForKey:@"Item 2"]);
    NSLog(@"Item 3: %@",[dictRoot valueForKey:@"Item 3"]);
    NSLog(@"Item 4: %@",[dictRoot valueForKey:@"Item 4"]);
    NSLog(@"Item 5: %@",[dictRoot valueForKey:@"Item 5"]);
    NSLog(@"Item 6: %@",[dictRoot valueForKey:@"Item 6"]);
    NSLog(@"Item 7: %@",[dictRoot valueForKey:@"Item 7"]);
    NSLog(@"Item 8: %@",[dictRoot valueForKey:@"Item 8"]);
    NSLog(@"Item 9: %@",[dictRoot valueForKey:@"Item 9"]);
  
}
@end
