//
//  AppDelegate.m
//  Routes
//
//  Created by yyy on 2022/3/20.
//

#import "AppDelegate.h"
#import "DemoListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.window makeKeyAndVisible];
        
        DemoListViewController *vc = [[DemoListViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window.rootViewController = navigationController;
    
    return YES;
}



@end
