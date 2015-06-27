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
    _happiness = 50;
    [self updateHappinessLabel];
    
    if (_happiness <= 50) {
        [self changeImage:@"sadPusheen" duration:0.3];
    } else {
        [self changeImage:@"contentPusheen" duration:0.3];
    }

}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)doMenuFeed {
    NSArray *plays = @[@"ricePusheen", @"noodlesPusheen", @"cookiePusheen"];
    NSString *randomPlay = plays[arc4random()%3];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"contentPusheen" duration:0.3];
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
            [self changeImage:@"contentPusheen" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (IBAction)doMenuCostume {
    NSArray *plays = @[@"dinoPusheen", @"nutellaPusheen", @"hpPusheen"];
    NSString *randomPlay = plays[arc4random()%3];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        if (_happiness <= 50) {
            [self changeImage:@"sadPusheen" duration:0.3];
        } else {
            [self changeImage:@"contentPusheen" duration:0.3];
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
            [self changeImage:@"contentPusheen" duration:0.3];
        }
    });
    
    [self addHappiness:5];
}

- (void)changeImage:(NSString *)imageSetName duration:(double)duration {
    [_pusheenImage setImageNamed:imageSetName];
    [_pusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 4)
                                                duration:duration
                                             repeatCount:0];
}

- (void)addHappiness:(int)increment{
    _happiness += increment;
    [self updateHappinessLabel];
}

- (void) updateHappinessLabel {
    int newHappiness = MIN(100, _happiness);
    _happinessLabel.text = [NSString stringWithFormat:@"%d%%", newHappiness];
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



