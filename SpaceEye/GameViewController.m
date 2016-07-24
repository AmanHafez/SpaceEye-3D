//
//  GameViewController.m
//
//
//  Created by Aman Hafaz on 7/20/16.
//  Copyright (c) 2016 Aman Hafaz. All rights reserved.
//

#import "GameViewController.h"
#import "PlanetInfoViewController.h"

@interface GameViewController()


@property SCNNode *sun;
@property SCNNode *mercury;
@property SCNNode *venus;
@property SCNNode *earth;
@property SCNNode *mars;
@property SCNNode *jupiter;
@property SCNNode *saturn;
@property SCNNode *uranus;
@property SCNNode *neptune;
@property SCNNode *pluto;
@property SCNScene *scene;
@property SCNView *scnView;
@property SCNNode *cameraNode;


@end


@implementation GameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];

    
}


- (void)setup {
    // create a new scene
    self.scene = [SCNScene sceneNamed:@"art.scnassets/SolarSystem.scn"];
    
    self.sun = [self.scene.rootNode childNodeWithName:@"Sun" recursively:YES];
    [self.sun runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:5]]];
    
    [self setupSceneElements:self.scene Node:_mercury NodeName:@"Mercury" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_venus NodeName:@"Venus" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_earth NodeName:@"Earth" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_mars NodeName:@"Mars" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_jupiter NodeName:@"Jupiter" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_saturn NodeName:@"Saturn" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_uranus NodeName:@"Uranus" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_neptune NodeName:@"Neptune" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
    [self setupSceneElements:self.scene Node:_pluto NodeName:@"Pluto" Action:[SCNAction rotateByX:0 y:-2 z:0 duration:1]];
  
    
    [self setInOrbit:_jupiter Action:[SCNAction moveTo:SCNVector3Make(20, 10, 0) duration:1]];
    
    //     create and add a camera to the scene
    _cameraNode = [SCNNode node];
    _cameraNode.camera = [SCNCamera camera];
    _cameraNode.camera.automaticallyAdjustsZRange = YES;
    [_scene.rootNode addChildNode:_cameraNode];
    
    
    // allows the user to manipulate the camera
    self.scnView.allowsCameraControl = YES;

    
    // retrieve the SCNView
    self.scnView = (SCNView *)self.view;
    
    // set the scene to the view
    self.scnView.scene = self.scene;
    
    self.scene.background.contents =  [UIImage imageNamed:@"Background"];
    
    // add a tap gesture recognizer
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 2;
    
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:tapGesture];
    [gestureRecognizers addObjectsFromArray: self.scnView.gestureRecognizers];
    
    self.scnView.gestureRecognizers = gestureRecognizers;
 
    
    UILongPressGestureRecognizer *longPressGestureRecognizer=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongPressRecognizer:)];
    longPressGestureRecognizer.numberOfTouchesRequired=1;
    longPressGestureRecognizer.minimumPressDuration = 0.5f;
    [self.scnView addGestureRecognizer:longPressGestureRecognizer];
    
}


- (void)setupSceneElements : (SCNScene*)scene Node:(SCNNode*)node NodeName:(NSString*)nodeName Action:(SCNAction *)action{
    
    node =  [scene.rootNode childNodeWithName:nodeName recursively:YES];
    [node runAction:[SCNAction repeatActionForever:action]];
  [_sun addChildNode:node];
}

- (void) setInOrbit: (SCNNode*)node Action:(SCNAction *)action{
      [node runAction:[SCNAction repeatActionForever:action]];
}



- (void) handleTap:(UIGestureRecognizer*)gestureRecognize
{
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    NSArray *hitResults = [scnView hitTest:p options:nil];
    
    // check that we clicked on at least one object
    if([hitResults count] > 0){
        if( [[[[hitResults firstObject]node]name]isEqualToString:@"Sun"]){
            PlanetInfoViewController *planetInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"PlanetInfoViewController"];
            [self presentViewController:planetInfo animated:YES completion:nil];
        }
    }

    
}



- (void) handleLongPressRecognizer:(UILongPressGestureRecognizer*)gestureRecognize
{
    // retrieve the SCNView
    SCNView *scnView = (SCNView *)self.view;
    
    // check what nodes are tapped
    CGPoint p = [gestureRecognize locationInView:scnView];
    NSArray *hitResults = [scnView hitTest:p options:nil];
    
    // check that we clicked on at least one object
    if([hitResults count] > 0){
        if( [[[[hitResults firstObject]node]name]isEqualToString:@"Sun"]){
            NSLog(@"Hi i'm long press");
        }
    }
        
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}




- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}


@end
