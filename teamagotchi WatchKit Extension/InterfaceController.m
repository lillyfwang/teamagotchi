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
    [_burritoPusheenImage setHidden:YES];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)doMenuFeed {
    
}

- (IBAction)doMenuParty {
}

- (IBAction)doMenuPlay {
    NSArray *plays = @[@"burritoPusheen", @"boxPusheen"];
    NSString *randomPlay = plays[arc4random()%2];
    
    [self changeImage:randomPlay duration:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self changeImage:@"cookiePusheen" duration:0.5];
    });
}

- (void)changeImage:(NSString *)imageSetName duration:(double)duration {
    [_cookiePusheenImage setImageNamed:imageSetName];
    [_cookiePusheenImage startAnimatingWithImagesInRange: NSMakeRange(0, 4)
                                                duration:duration
                                             repeatCount:0];
}

@end



