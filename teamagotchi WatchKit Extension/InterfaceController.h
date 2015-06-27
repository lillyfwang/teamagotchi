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
@property (weak, nonatomic) IBOutlet WKInterfaceImage *pusheenImage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *happinessLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *primaryIcon;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *secondaryIcon;
@property int happiness;

- (IBAction)doMenuPlay;

- (IBAction)doMenuFeed;

- (IBAction)doMenuParty;

- (IBAction)doMenuCostume;

- (void) updateHappinessLabel;

- (void)addHappiness:(int)increment;

@end
