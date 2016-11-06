//
//  ViewController.h
//  LogFood
//
//  Created by Mei Kai Koh on 5/11/16.
//  Copyright © 2016 UW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    __weak IBOutlet UILabel *timeLabel;
    NSTimer *timer;
    UIImage *image;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) UIImage *recipeImage;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSMutableArray *eatenToday;
@property (weak, nonatomic) IBOutlet UIImageView *timeBack;
@property (weak, nonatomic) IBOutlet UIImageView *shouldEat;
@property (weak, nonatomic) IBOutlet UILabel *proteinLabel;
@property (weak, nonatomic) IBOutlet UILabel *carbLabel;
@property (weak, nonatomic) IBOutlet UILabel *fatLabel;

@end

