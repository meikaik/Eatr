//
//  CollectionViewController.h
//  LogFood
//
//  Created by Harshil Parikh on 2016-11-05.
//  Copyright © 2016 UW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>{
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end
