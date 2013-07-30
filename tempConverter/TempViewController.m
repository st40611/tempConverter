//
//  TempViewController.m
//  tempConverter
//
//  Created by Ben Lin on 7/24/13.
//  Copyright (c) 2013 Ben Lin. All rights reserved.
//

#import "TempViewController.h"

@interface TempViewController ()

- (void)convert;
- (void)onDoneButton;

@end

@implementation TempViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=@"Temperature Conversion";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.originalTemperature.delegate = self;
    
    [self.selector addTarget:self action:@selector(convert) forControlEvents:UIControlEventValueChanged];
    self.selector.selectedSegmentIndex = 0;
    self.originalTemperature.text = @"0.0";
    [self convert];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)onDoneButton {
    [self.view endEditing:YES];
    [self convert];
}

- (void)convert {
    int type = self.selector.selectedSegmentIndex;
    
    float temp = [self.originalTemperature.text floatValue];
    float newTemp = 0.0;
    if (type == 0) {
        newTemp = (5 * (temp - 32)) / 9;
        self.finalTemperature.text = [NSString stringWithFormat:@"%0.2f C", newTemp];
    }
    else {
        newTemp = (9 * (temp + 32)) / 5;
        self.finalTemperature.text = [NSString stringWithFormat:@"%0.2f F", newTemp];
    }
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone  target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self convert];
    
    return YES;
}

@end
