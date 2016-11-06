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

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calcFunc:(id)sender {
    int *calorieRequired = 0;
    if(_GenderBar.selectedSegmentIndex==0){
        calorieRequired = 864 - 10 * [self.AgeSlider.text intValue] + (14 * [self.WeightSlider.text intValue]/2 + 503 * [self.HeightSlider.text intValue]/100);
    }
    else{
        calorieRequired = 387 - 7 * [self.AgeSlider.text intValue] + (11 * [self.WeightSlider.text intValue]/2 + 661 * [self.HeightSlider.text intValue]/100);
    }
    
    _CalorieExpenditure.text = [NSString stringWithFormat:@"%d", calorieRequired];
    
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:[NSString stringWithFormat:@"%d", calorieRequired] forKey:@"calorie"];
}
@end

