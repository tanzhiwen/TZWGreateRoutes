//
//  DemoListViewController.h
//  Routes
//
//  Created by yyy on 2022/3/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIViewController * _Nullable(^ViewControllerHandler)(void);
@interface DemoListViewController : UIViewController

+ (void)registerWithTitle:(NSString *)title handler:(ViewControllerHandler)handler;

@end

NS_ASSUME_NONNULL_END
