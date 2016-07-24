//
//  GameViewController.m
//  rrrrrrr
//
//  Created by OmarRO on 7/20/16.
//  Copyright (c) 2016 OmarRO. All rights reserved.
//

#import "GameViewController.h"


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
    [self setupSceneElements:self.scene];

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
    
//    self.scnView.showsStatistics = YES;   // For Debugging.
    
    self.scene.background.contents =  [UIImage imageNamed:@"Background"];
    
    // add a tap gesture recognizer
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    NSMutableArray *gestureRecognizers = [NSMutableArray array];
    [gestureRecognizers addObject:tapGesture];
    [gestureRecognizers addObjectsFromArray: self.scnView.gestureRecognizers];
    self.scnView.gestureRecognizers = gestureRecognizers;
    
}



- (void)setupSceneElements : (SCNScene*)scene {
     self.sun = [scene.rootNode childNodeWithName:@"Sun" recursively:YES];
    [self.sun runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:4]]];
    
    self.mercury =  [scene.rootNode childNodeWithName:@"Mercury" recursively:YES];
    [self.mercury runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
   self.mercury.pivot = SCNMatrix4MakeTranslation (30,0,0);
  
    self.venus = [scene.rootNode childNodeWithName:@"Venus" recursively:YES];
    [self.venus runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
  self.venus.pivot = SCNMatrix4MakeTranslation (40,0,0);
    [_sun addChildNode:_venus];


    self.earth = [scene.rootNode childNodeWithName:@"Earth" recursively:YES];
    [self.earth runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    self.earth.pivot = SCNMatrix4MakeTranslation (50,0,0);
    
   
    

    self.mars = [scene.rootNode childNodeWithName:@"Mars" recursively:YES];
    [self.mars runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
   self.mars.pivot = SCNMatrix4MakeTranslation (60,0,0);

    self.jupiter = [scene.rootNode childNodeWithName:@"Jupiter" recursively:YES];
    [self.jupiter runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    self.jupiter.pivot = SCNMatrix4MakeTranslation (70,0,0);
    

    self.saturn = [scene.rootNode childNodeWithName:@"Saturn" recursively:YES];
    [self.saturn runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    self.saturn.pivot = SCNMatrix4MakeTranslation (80,0,0);
    
    self.uranus = [scene.rootNode childNodeWithName:@"Uranus" recursively:YES];
    [self.uranus runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
   self.uranus.pivot = SCNMatrix4MakeTranslation (90,0,0);


    self.neptune = [scene.rootNode childNodeWithName:@"Neptune" recursively:YES];
    [self.neptune runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
   self.neptune.pivot = SCNMatrix4MakeTranslation (100,0,0);

    self.pluto = [scene.rootNode childNodeWithName:@"Pluto" recursively:YES];
    [self.pluto runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
   self.pluto.pivot = SCNMatrix4MakeTranslation (110,0,0);
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
        // retrieved the first clicked object
        SCNHitTestResult *result = [hitResults objectAtIndex:0];
        
        // get its material
        SCNMaterial *material = result.node.geometry.firstMaterial;
        
        // highlight it
        [SCNTransaction begin];
        [SCNTransaction setAnimationDuration:0.5];
        
        // on completion - unhighlight
        [SCNTransaction setCompletionBlock:^{
            [SCNTransaction begin];
            [SCNTransaction setAnimationDuration:0.5];
            
            material.emission.contents = [UIColor redColor];
            
            [SCNTransaction commit];
        }];
        
        material.emission.contents = [UIColor redColor];
        
        [SCNTransaction commit];
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
