//
//  ViewController.h
//  teamagotchi
//
//  Created by Lilly Wang on 6/26/15.
//  Copyright (c) 2015 Lilly Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;
double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

@interface ViewController : UIViewController <UIAccelerometerDelegate>{
    float valueX;
    float valueY;
    
}
@property (weak, nonatomic) IBOutlet UILabel *maxAccX;

@property (weak, nonatomic) IBOutlet UILabel *maxAccY;
@property (weak, nonatomic) IBOutlet UILabel *maxAccZ;
@property (weak, nonatomic) IBOutlet UILabel *accX;
@property (weak, nonatomic) IBOutlet UILabel *accY;
@property (weak, nonatomic) IBOutlet UILabel *accZ;
@property (weak, nonatomic) IBOutlet UILabel *rotX;
@property (weak, nonatomic) IBOutlet UILabel *rotY;
@property (weak, nonatomic) IBOutlet UILabel *rotZ;
@property (weak, nonatomic) IBOutlet UIButton *resetMaxValuesBtn;

@property (strong, nonatomic) CMMotionManager *motionManager;


@end

