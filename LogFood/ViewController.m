//
//  ViewController.m
//  LogFood
//
//  Created by Mei Kai Koh on 5/11/16.
//  Copyright © 2016 UW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5f
                                                  target:self
                                                selector:@selector(showTime)
                                                userInfo:NULL
                                                 repeats:YES];
    // Category Food Carbs Protein Fats Calories
    NSArray *ingredients = [NSArray arrayWithObjects:
                            [NSArray arrayWithObjects:@"Breakfast", @"Orange Juice", @"26", @"2", @"1", @"110", nil], nil];
    
    NSLog(@"%@", [[ingredients objectAtIndex:0] objectAtIndex:3]);
}

- (void)showTime{
    NSDate *now=[NSDate date];
    NSDateFormatter *dateFormatter=[NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm"];
    timeLabel.text=[dateFormatter stringFromDate:now];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)AddPage:(id)sender {
}
- (IBAction)SettingsPage:(id)sender {
}

@end
