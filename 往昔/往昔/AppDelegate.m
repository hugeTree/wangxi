//
//  AppDelegate.m
//  往昔
//
//  Created by 干晨威 on 16/2/3.
//  Copyright © 2016年 干晨威. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "LogInViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.window makeKeyAndVisible];
    
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    
    NSString *string = [userDefaultes stringForKey:@"Name"];
    
    if (string.length == 0) {
        UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"LogIn" bundle:nil];
        
        LogInViewController *logInController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
        self.window.rootViewController = logInController;
    }else{
        
        BaseTabBarController *baseTabBarController = [[BaseTabBarController alloc] init];
        
        self.window.rootViewController = baseTabBarController;
        
    }
    
//    NSFileManager *manager = [NSFileManager defaultManager];
//    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"documents/emotions.plist"];
//    
//    NSLog(@"%@",path);
        return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
