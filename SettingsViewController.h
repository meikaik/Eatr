//
//  SettingsViewController.h
//  LogFood
//
//  Created by Harshil Parikh on 2016-11-05.
//  Copyright © 2016 UW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController{
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *GenderBar;

@property (strong, nonatomic) IBOutlet UILabel *AgeSlider;
@property (strong, nonatomic) IBOutlet UILabel *HeightSlider;
@property (strong, nonatomic) IBOutlet UILabel *WeightSlider;
@property (strong, nonatomic) IBOutlet UILabel *CalorieExpenditure;
- (IBAction)calcFunc:(id)sender;

@end
