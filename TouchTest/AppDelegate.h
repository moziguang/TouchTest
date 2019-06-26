//
//  AppDelegate.h
//  TouchTest
//
//  Created by qianyuan on 2019/6/26.
//  Copyright © 2019 qianyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

