//
//  InterfaceController.m
//  teamagotchi WatchKit Extension
//
//  Created by Lilly Wang on 6/26/15.
//  Copyright (c) 2015 Lilly Wang. All rights reserved.
//

#import "InterfaceController.h"
#import "stdlib.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _happiness = [defaults integerForKey:@"savedHappiness"];
    NSInteger notFirstLaunch = [defaults integerForKey:@"firstLaunch"];
    if (!notFirstLaunch && _happiness == 0) _happiness = 100;
    NSDate *lastDate = [defaults objectForKey:@"lastCloseDate"];
    NSTimeInterval timeDiff = [[NSDate date] timeIntervalSinceDate:lastDate];
    double happinessChange = timeDiff / 10;
    _happiness -= happinessChange;
    
    [self updateHappinessLabel];
    
    if (_happiness <= 50) {
        [self changeImage:@"sadPusheen" duration:0.3];
    } else {
        [self changeImage:@"normal" duration:0.3];
    }

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSDate date] forKey:@"lastCloseDate"];
    [defaults setInteger:_happiness forKey:@"savedHappiness"];
    [defaults setInteger:1 forKey:@"notFirstLaunch"];
    [defaults synchronize];
    
    [super didDeactivate];
}

- (IBAction)doMenuFeed {
    NSArray *plays = @[@"ricePusheen", @"noodlesPusheen", @"cookiePusheen", @"cheetosPusheen"];
    NSString *randomPlay = plays[arc4random()%4];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"normal" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (IBAction)doMenuParty {
    NSString *randomPlay = @"partyPusheen";
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"normal" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (IBAction)doMenuCostume {
    NSArray *plays = @[@"dinoPusheen", @"nutellaPusheen", @"hpPusheen"];
    NSString *randomPlay = plays[arc4random()%3];
    
    [self changeImage:randomPlay duration:0.7];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"normal" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (IBAction)doMenuPlay {
    NSArray *plays = @[@"burritoPusheen", @"boxPusheen"];
    NSString *randomPlay = plays[arc4random()%2];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"normal" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (void)changeImage:(NSString *)imageSetName duration:(double)duration {
    [_pusheenImage setImageNamed:imageSetName];
    if ([imageSetName  isEqual: @"normal"]) {
        NSArray *normal = @[@"laserPusheen", @"contentPusheen"];
        NSString *name = normal[arc4random()%2];
        
        [_pusheenImage setImageNamed:name];
        if ([name isEqual: @"laserPusheen"]) {
            [_pusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 14)
                                                  duration:1
                                               repeatCount:0];
        } else {
            [_pusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 4)
                                                  duration:duration
                                               repeatCount:0];
        }
    } else {
        [_pusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 4)
                                              duration:duration
                                           repeatCount:0];
    }
}

- (void)addHappiness:(int)increment{
    _happiness += increment;
    [self updateHappinessLabel];
}

- (void) updateHappinessLabel {
    NSInteger newHappiness = MAX(0, MIN(100, _happiness));
    _happinessLabel.text = [NSString stringWithFormat:@"%d%%", (int)newHappiness];
}

/*
private func changeHappiness() {
    let lastDate = defaults.objectForKey("lastCloseDate")
    let timeDiff = NSDate.timeIntervalSinceDate(lastDate)
    let happinessChange = timeDiff / 60
    happiness -= happinessChange
}
*/

@end



