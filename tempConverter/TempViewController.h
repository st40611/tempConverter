//
//  TempViewController.h
//  tempConverter
//
//  Created by Ben Lin on 7/24/13.
//  Copyright (c) 2013 Ben Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TempViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *originalTemperature;
@property (nonatomic, weak) IBOutlet UISegmentedControl *selector;
@property (nonatomic, weak) IBOutlet UILabel *finalTemperature;

-(IBAction)onDoneButton;

@end
