//
//  AppDelegate.h
//  LogFood
//
//  Created by Mei Kai Koh on 5/11/16.
//  Copyright © 2016 UW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

