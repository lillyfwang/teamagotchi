//
//  ViewController.m
//  teamagotchi
//
//  Created by Lilly Wang on 6/26/15.
//  Copyright (c) 2015 Lilly Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}


-(void) viewDidLoad {
    // Request to turn on accelerometer and begin receiving accelerometer events
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    // Create a mutable set to store the category definitions.
    NSMutableSet* categories = [NSMutableSet set];
    
    // Define the actions for a meeting invite notification.
    UIMutableUserNotificationAction* acceptAction = [[UIMutableUserNotificationAction alloc] init];
    acceptAction.title = NSLocalizedString(@"Log", @"Log Workout");
    acceptAction.identifier = @"log_workout";
    acceptAction.activationMode = UIUserNotificationActivationModeForeground; //UIUserNotificationActivationModeBackground if no need in foreground.
    acceptAction.authenticationRequired = NO;
    
    // Create the category object and add it to the set.
    UIMutableUserNotificationCategory* inviteCategory = [[UIMutableUserNotificationCategory alloc] init];
    [inviteCategory setActions:@[acceptAction]
                    forContext:UIUserNotificationActionContextDefault];
    inviteCategory.identifier = @"Workout";
    
    [categories addObject:inviteCategory];
    
    // Configure other actions and categories and add them to the set...
    
    UIUserNotificationSettings* settings = [UIUserNotificationSettings settingsForTypes:
                                            (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound)
                                                                             categories:categories];
    
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound categories:categories]];
    }
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData  *accelerometerData, NSError *error) {
                                                 [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
                                             }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake)
    {
        // User was shaking the device. Post a notification named "shake."
        [[NSNotificationCenter defaultCenter] postNotificationName:@"shake" object:self];
        
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        if (notification) {
            notification.alertBody = @"Congrats! You earned a workout!";
            notification.alertAction = @"Log workout";
            notification.fireDate = [NSDate dateWithTimeIntervalSinceNow: 5];
            notification.soundName = UILocalNotificationDefaultSoundName;
            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        }
    }
}




-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
    }
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelZ];
    
    
}
-(void)outputRotationData:(CMRotationRate)rotation
{
    
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x];
    if(fabs(rotation.x) > fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
    self.rotX.text = [NSString stringWithFormat:@" %.2f",currentMaxRotX];
    self.rotY.text = [NSString stringWithFormat:@" %.2f",currentMaxRotY];
    self.rotZ.text = [NSString stringWithFormat:@" %.2f",currentMaxRotZ];
}

- (IBAction)resetMaxValues:(id)sender {
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
}

- (void)orientationChanged:(NSNotification *)notification {
    // Respond to changes in device orientation
}

/*-(void) viewDidDisappear {
    // Request to stop receiving accelerometer events and turn off accelerometer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
