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
{
    int _happiness;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    _happiness = 50;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
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
        [self changeImage:@"contentPusheen" duration:0.5];
    });
    
    _happiness += 5;
}

- (IBAction)doMenuParty {
    NSString *randomPlay = @"partyPusheen";
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self changeImage:@"contentPusheen" duration:0.3];
    });
    
    _happiness += 5;
}

- (IBAction)doMenuPlay {
    NSArray *plays = @[@"burritoPusheen", @"boxPusheen"];
    NSString *randomPlay = plays[arc4random()%2];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self changeImage:@"contentPusheen" duration:0.5];
    });
    
    _happiness += 5;
}

- (void)changeImage:(NSString *)imageSetName duration:(double)duration {
    [_pusheenImage setImageNamed:imageSetName];
    [_pusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 4)
                                                duration:duration
                                             repeatCount:0];
}

- (int) happiness {
    return _happiness;
}

- (void) setHappiness:(int)happiness {
    _happiness = happiness;
    [self updateHappinessLabel];
}

- (void) updateHappinessLabel {
    int newHappiness = MAX(100, _happiness);
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



