//
//  EXSlidingSegue.m
//  ECSlidingViewController
//
//  Created by Jonathan Bennett on 2012-11-13.
//
//

#import "ECSlidingSegue.h"
#import "ECSlidingViewController.h"

@implementation ECSlidingSegue

- (void)perform
{
    UIViewController *source = (UIViewController *)self.sourceViewController;
    UIViewController *destination = (UIViewController *)self.destinationViewController;
    ECSlidingViewController *slide = source.slidingViewController;
    ECSide side = (source == slide.underLeftViewController ||
                   source.navigationController == slide.underLeftViewController ||
                   source.tabBarController == slide.underLeftViewController) ? ECRight : ECLeft;
    
    [slide anchorTopViewOffScreenTo:side animations:nil onComplete:^{
        CGRect frame = source.slidingViewController.topViewController.view.frame;
        slide.topViewController = destination;
        slide.topViewController.view.frame = frame;
        [slide resetTopView];
        
        [destination.view addGestureRecognizer:slide.panGesture];
    }];
}

@end
