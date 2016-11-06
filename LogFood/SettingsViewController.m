//
//  SettingsViewController.m
//  LogFood
//
//  Created by Harshil Parikh on 2016-11-05.
//  Copyright © 2016 UW. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)AgeSlider:(id)sender {
    UISlider *AgeSlider = (UISlider*)sender;
    NSString *AgeVal;
    AgeVal = [NSString stringWithFormat:@"%.0f", AgeSlider.value];
    
    self.AgeSlider.text = AgeVal;
}
- (IBAction)HeightSlider:(id)sender {
    UISlider *HeightSlider = (UISlider*)sender;
    NSString *HeightVal;
    HeightVal = [NSString stringWithFormat:@"%.0f", HeightSlider.value];
    
    self.HeightSlider.text = HeightVal;

}

- (IBAction)WeightSlider:(id)sender {
    UISlider *WeightSlider = (UISlider*)sender;
    NSString *WeightVal;
    WeightVal = [NSString stringWithFormat:@"%.0f", WeightSlider.value];
    
    self.WeightSlider.text = WeightVal;
}

- (void) returnCals {
    //NSNumber *CalorieExpenditure = 864 - 9.72 * self.AgeSlider.text + 1 * (14.2 * self.WeightSlider.text + 503 * self.HeightSlider.text);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

