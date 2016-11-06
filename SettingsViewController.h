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
@property (strong, nonatomic) IBOutlet UIView *AgeSlider;
@property (strong, nonatomic) IBOutlet UISlider *WeightSlider;
@property (strong, nonatomic) IBOutlet UISlider *HeightSlider;
@property (strong, nonatomic) IBOutlet UISegmentedControl *GenderSlider;

@end
