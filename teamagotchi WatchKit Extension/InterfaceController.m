//
//  InterfaceController.m
//  teamagotchi WatchKit Extension
//
//  Created by Lilly Wang on 6/26/15.
//  Copyright (c) 2015 Lilly Wang. All rights reserved.
//

#import "InterfaceController.h"


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

- (IBAction)doMenuPlay {
    
    
    [_burritoPusheenImage setHidden:NO];
    [_cookiePusheenImage setHidden:YES];
    
    
    
}

//- (void)handleTap:(UITapGestureRecognizer *)sender
//{
//    if (sender.state == UIGestureRecognizerStateEnded)
//    {
//        // handling code
//    }
//}

@end



