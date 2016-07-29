//
//  GameViewController.m
//
//
//  Created by Aman Hafaz on 7/20/16.
//  Copyright (c) 2016 Aman Hafaz. All rights reserved.
//

#import "GameViewController.h"
#import "PlanetInfoViewController.h"
#import "DateTimePicker.h"

@interface GameViewController()


@property (nonatomic, strong) SCNNode *sun;
@property (nonatomic, strong) SCNNode *mercury;
@property (nonatomic, strong) SCNNode *venus;
@property (nonatomic, strong) SCNNode *earth;
@property (nonatomic, strong) SCNNode *mars;
@property (nonatomic, strong) SCNNode *jupiter;
@property (nonatomic, strong) SCNNode *saturn;
@property (nonatomic, strong) SCNNode *uranus;
@property (nonatomic, strong) SCNNode *neptune;
@property (nonatomic, strong) SCNNode *pluto;
@property (nonatomic, strong) SCNScene *scene;
@property (nonatomic, strong) SCNView *scnView;
@property (nonatomic, strong) SCNNode *cameraNode;

@property (nonatomic, getter=isPaused) BOOL paused;
@property (nonatomic, strong) NSArray *x;
@property (nonatomic, strong) NSArray *y;
@property (nonatomic, strong) NSArray *z;
@property (nonatomic, strong) NSArray *PlanetName;
@property (nonatomic, strong) NSDictionary *XPosition;
@property (nonatomic, strong) NSDictionary *YPosition;
@property (nonatomic, strong) NSDictionary *ZPosition;
@property  BOOL flag;
@property DateTimePicker *picker;

@end


@implementation GameViewController

float x[9];
float y[9];
float z[9];

-(void)viewDidLoad
{
    [super viewDidLoad];
    _flag = YES;
    [self setup];
}

#pragma mark - setupView

- (void)setup {
    // create a new scene
    self.scene = [SCNScene sceneNamed:@"art.scnassets/SolarSystem.scn"];
    
    self.sun = [self.scene.rootNode childNodeWithName:@"Sun" recursively:YES];
    [self.sun runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:2 z:0 duration:5]]];
    
    self.mercury = [self.scene.rootNode childNodeWithName:@"Mercury" recursively:YES];
    [self.mercury runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.venus = [self.scene.rootNode childNodeWithName:@"Venus" recursively:YES];
    [self.venus runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    

    self.earth = [self.scene.rootNode childNodeWithName:@"Earth" recursively:YES];
    [self.earth runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.mars = [self.scene.rootNode childNodeWithName:@"Mars" recursively:YES];
    [self.mars runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.mercury = [self.scene.rootNode childNodeWithName:@"Mercury" recursively:YES];
    [self.mercury runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.jupiter = [self.scene.rootNode childNodeWithName:@"Jupiter" recursively:YES];
    [self.jupiter runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    
    self.saturn = [self.scene.rootNode childNodeWithName:@"Saturn" recursively:YES];
    [self.saturn runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.uranus = [self.scene.rootNode childNodeWithName:@"Uranus" recursively:YES];
    [self.uranus runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.neptune = [self.scene.rootNode childNodeWithName:@"Neptune" recursively:YES];
    [self.neptune runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];
    
    self.pluto = [self.scene.rootNode childNodeWithName:@"Pluto" recursively:YES];
    [self.pluto runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:-2 z:0 duration:1]]];

    

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
    longPressGestureRecognizer.minimumPressDuration = 1.0f;
    [self.scnView addGestureRecognizer:longPressGestureRecognizer];
    
}






#pragma mark - handel gestures

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
            PlanetInfoViewController *planetInfo = [self.storyboard instantiateViewControllerWithIdentifier:@"PlanetsInfoNavigationController"];
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
        if( [[[[hitResults firstObject]node]name]isEqualToString:@"Sun"] && _flag){
            _picker = [[DateTimePicker alloc] initWithFrame:CGRectMake(0, 0, 325, 250)];
            [_picker addTargetForDoneButton:self action:@selector(donePressed)];
            [_picker addTargetForCancelButton:self action:@selector(cancelPressed)];
            [self.view addSubview:_picker];
            _picker.hidden = NO;
            [_picker setMode:UIDatePickerModeDate];
            [_picker.picker addTarget:self action:@selector(datePickerDateChanged:) forControlEvents:UIControlEventValueChanged];
            
            self.scene.paused = YES;
            _flag = NO;
            
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


#pragma mark- DatePicker

-(void) datePickerDateChanged:(id)sender
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    NSString *dateString = [dateFormatter stringFromDate:[(UIDatePicker*)sender date]];
    NSDate *datepicked = [dateFormatter dateFromString:dateString];
    
    NSTimeInterval date = [datepicked timeIntervalSince1970];
    long long millisFromJ2000 = (long long)  date * 1000.0;
    long long blah =1000 *60*60*24*365.25 *100;
    float CenturiesFromj2000 = (float)millisFromJ2000 / (float) blah;
    NSLog(@"%.8f", CenturiesFromj2000);
    
    //Keplerian elements of each planet, with respect to the mean ecliptic and equinox of j2000; Valid for the time-interval 3000 BC -- 3000 AD
    
    //semi-major axis
    float a0[] = { 0.38709843, 0.72332102,  1.00000018, 1.52371243, 5.20248019, 9.54149883, 19.18916464 , 30.06952752, 39.48686035};
    float adot[] = {0.00000000, -0.00000026, -0.00000003, 0.00000097, -0.00002864, -0.00003065,-0.000020455, 0.00006447 , 0.00449751}; //time derivative
    float a[9];
    
    
    //eccentricity of planet orbit
    float e0[] = { 0.20563661, 0.00676399, 0.01673163, 0.09336511, 0.04853590, 0.05550825, 0.04685740, 0.00895439, 0.24885238 };
    float edot[] = {0.00002123, -0.00005107, -0.00003661, 0.00009149, 0.00018026, -0.00032044, -0.00001550, 0.00000818, 0.00006016}; //time derivative
    float e[9];
    
    
    //inclination
    float I0[] = { 7.00559432, 3.39777545, -0.00054346, 1.85181869, 1.29861416, 2.49424102, 0.77298127, 1.77005520, 17.14104260};
    float Idot[] = {-0.00590158, 0.00043494, -0.01337178,  -0.00724757,  -0.00322699,  0.00451969, -0.00180155, 0.00022400, 0.00000501}; //time derivative
    float In[9];
    
    float L0[] = {252.25166724, 181.97970850, 100.46691572, -4.56813164, 34.33479152, 50.07571329, 314.20276625, 304.22289287, 238.96535011};
    float Ldot[] ={149472.67486623, 58517.81560260, 35999.37306329, 19140.29934243, 3034.90371757, 1222.11494724, 428.4951259, 218.46515314, 145.18042903}; //time derivative
    float L[9];
    
    
    //Longtitude of periapsis
    float LongP0[] = {77.45771895, 131.76755713, 102.93005885, -23.91744784, 14.27495244, 92.86136063, 172.43404441, 46.68158724, 224.09702598, -0.00968827};
    float LongPdot[] = {0.15940013, 0.05679648, 0.31795260, 0.45223625, 0.18199196, 0.54179478, 0.09266985, 0.01009938, -0.00968827};//time derivative
    float LongP[9];
    
    
    //Longitude of ascending node
    float Longn0[] = {48.33961819, 76.67261496, -5.11260389, 49.71320984, 100.29282654, 113.63998702, 73.96250215, 131.78635853, 110.30167986};
    float Longndot[] = {-0.12214182, -0.27274174, -0.24123856, -0.26852431, 0.13024619, 73.96250215, 131.78635853, 110.30167986}; //time derivative
    float Longn[9];
    
    //Additional terms which must be added to the computation of M for Jupiter through Pluto,
    float b0[] = {-0.00012452, 0.00025899, 0.00058331, -0.00041348, -0.01262724};
    float c0[] = { 0.06064060, -0.13434469, -0.97731848, 0.68346318};
    float s0[] = {-0.35635438, 0.87320147, 0.17689245, -0.10162547};
    float f0[] = {38.35125000,38.35125000, 7.67025000, 7.67025000};
    float b[9];
    float c[8];
    float s[8];
    float f[8];
    
    
    for(int i = 4; i<9; i++)
    {
        
        b[i] = b[i] + b0[i-4];
        
    }
    
    for (int i = 4; i<8; i++)
    {
        c[i] = c[i] + c0[i-4];
        s[i] = s[i] + s0[i-4];
        f[i] = f[i] + f0[i-4];
        
    }
    
    //Calcutlation of orbital parameters
    for (int i = 0; i < 9; i++)
    {
        
        a[i] = a0[i] + adot[i] * CenturiesFromj2000;
        e[i] = e0[i] + edot[i] * CenturiesFromj2000;
        In[i] = I0[i] + Idot[i] * CenturiesFromj2000;
        L[i] = L0[i] + Ldot[i] * CenturiesFromj2000;
        LongP[i] = LongP0[i] + LongPdot[i] * CenturiesFromj2000;
        Longn[i] = Longn0[i] + Longndot[i] * CenturiesFromj2000;
        
        if (i >= 4)
        {
            L[i] = L[i] + b[i] * pow(CenturiesFromj2000, 2);
        }
        
    }
    
    //Continuing the calculation of L
    for (int i = 0; i < 8; i++)
    {
        if (i>=4)
        {
            L[i] = L[i] + c[i] * cosf(f[i] * CenturiesFromj2000) + s[i] * sinf(f[i] * CenturiesFromj2000);
        }
    }
    
    //Getting M (mean anomaly)
    float M[9];
    float w[9];
    
    for (int i = 0; i<9; i++)
    {
        M[i] = L[i] - LongP[i];
        w[i] = LongP[i] = Longn[i];
    }
    
    /*        Now we get to calculate the Equation M = E - e * sin(E)   (with M known)
     
     We can solve this numerically using Newton's method. Solving the Kepler equation is equivalent to finding the roots of f(E)= E − e * sin(E) − M.
     Given Ei => f(E) = E - e * sin(E) - M
     
     E(i+1) = Ei - f(Ei)/ f'(Ei)
     f'(E) = 1 - e * cos(E) dE
     
     Since the nonlinear part e* sin(E) is very small, we can start with the estimate E = M
     
     */
    
    float E[9];  //E Eccentric anomaly
    float dE[9]; //derivative of E
    
    //Computing E (main equation)
    for (int i = 0; i <9; i++)
    {
        E[i] = M[i];
        
        while(E[i] == M[i])
        {
            dE[i] = (E[i] - e[i] * sinf(E[i]) - M[i])/(1 - e[i] *cosf(E[i]));
            E[i] -= dE[i];
            
            if(fabs(dE[i]) < 1e-6)
                break;
        }
        
    }
    
    // P and Q form a 2d coordinate system in the plane of the orbit
    float P[9];
    float Q[9];
    
    for (int i = 0; i<9 ; i++)
    {
        P[i] = a[i] * cosf(E[i] - e[i]);
        Q[i] = a[i] * sinf(E[i]) * sqrtf(1 - powf(e[i], 2.0));
    }
    //rotating 2d coordinates into full 3d coordinate system
    
    for (int i = 0; i<9; i++)
    {
        //rotating by argument of priapsis
        x[i] = cosf(w[i]) * P[i] - sinf(w[i]) * Q[i];
        y[i] = sinf(w[i]) * P[i] + cosf(w[i]) * Q[i];
        
        //rotating by inclination
        z[i] = sinf(In[i]) * x[i];
        x[i] = cosf(In[i]) * x[i];
        
        //rotate by longitude of ascending node
        float tempx[9];
        tempx[i] = x[i];
        x[i] = cosf(Longn[i]) * tempx[i] - sinf(Longn[i]) * y[i];
        y[i] = sinf(Longn[i]) * tempx[i] + cosf(Longn[i]) * y[i];
        
    }
    
    self.x = [NSArray arrayWithObjects:[NSNumber numberWithFloat:x[0]],[NSNumber numberWithFloat:x[1]],[NSNumber numberWithFloat:x[2]],[NSNumber numberWithFloat:x[3]],[NSNumber numberWithFloat:x[4]],[NSNumber numberWithFloat:x[5]],[NSNumber numberWithFloat:x[6]],[NSNumber numberWithFloat:x[7]],[NSNumber numberWithFloat:x[8]], nil];
    
    self.y = [NSArray arrayWithObjects:[NSNumber numberWithFloat:y[0]],[NSNumber numberWithFloat:y[1]],[NSNumber numberWithFloat:y[2]],[NSNumber numberWithFloat:y[3]],[NSNumber numberWithFloat:y[4]],[NSNumber numberWithFloat:y[5]],[NSNumber numberWithFloat:y[6]],[NSNumber numberWithFloat:y[7]],[NSNumber numberWithFloat:y[8]], nil];
    self.z = [NSArray arrayWithObjects:[NSNumber numberWithFloat:z[0]],[NSNumber numberWithFloat:z[1]],[NSNumber numberWithFloat:z[2]],[NSNumber numberWithFloat:z[3]],[NSNumber numberWithFloat:z[4]],[NSNumber numberWithFloat:z[5]],[NSNumber numberWithFloat:z[6]],[NSNumber numberWithFloat:z[7]],[NSNumber numberWithFloat:z[8]], nil];
    
    
    //self.scene.paused = NO;
    
}



-(void)donePressed{
    _picker.hidden = YES;
    
    
    [self.mercury runAction:[SCNAction moveBy:SCNVector3Make(x[0], y[0], z[0]) duration:1]];
    
    [self.venus runAction:[SCNAction moveBy:SCNVector3Make(x[1], y[1], z[1]) duration:1]];
    [self.earth runAction:[SCNAction moveBy:SCNVector3Make(x[2], y[2], z[2]) duration:1]];
    [self.mars runAction:[SCNAction moveBy:SCNVector3Make(x[3], y[3], z[3]) duration:1]];
    [self.jupiter runAction:[SCNAction moveBy:SCNVector3Make(x[4], y[4], z[4]) duration:1]];
    [self.saturn runAction:[SCNAction moveBy:SCNVector3Make(x[5], y[5], z[5]) duration:1]];
    [self.uranus runAction:[SCNAction moveBy:SCNVector3Make(x[6], y[6], z[6]) duration:1]];
    [self.neptune runAction:[SCNAction moveBy:SCNVector3Make(x[7], y[7], z[7]) duration:1]];
    [self.pluto runAction:[SCNAction moveBy:SCNVector3Make(x[8], y[8], z[8]) duration:1]];

    self.scene.paused = NO;
    _flag = YES;
    
    
}

-(void)cancelPressed {
    _picker.hidden = YES;
    self.scene.paused = NO;
    _flag = YES;
    
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
