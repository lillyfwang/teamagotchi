//
//  InterfaceController.h
//  teamagotchi WatchKit Extension
//
//  Created by Lilly Wang on 6/26/15.
//  Copyright (c) 2015 Lilly Wang. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceImage *cookiePusheenImage;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *burritoPusheenImage;

- (IBAction)doMenuPlay;

- (IBAction)doMenuFeed;

- (IBAction)doMenuParty;

@end
