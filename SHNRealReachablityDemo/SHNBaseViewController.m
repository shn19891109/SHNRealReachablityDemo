//
//  SHNBaseViewController.m
//  SHNRealReachablityDemo
//
//  Created by 苏浩楠 on 16/2/24.
//  Copyright © 2016年 suhaonan. All rights reserved.
//

#import "SHNBaseViewController.h"

#import <RealReachability/RealReachability.h>

#import "SHNNotNetWorkView.h"

@interface SHNBaseViewController ()<SHNNotNetWorkViewDelegate>

@end

@implementation SHNBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [GLobalRealReachability startNotifier];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];

}

/**监听网络状态改变*/
- (void)networkChanged:(NSNotification *)notification{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    NSLog(@"currentStatus:%@",@(status));
    self.isNotNetworkState = NO;
    if (status == RealStatusNotReachable) {
        self.isNotNetworkState = YES;
    }
    if (status == RealStatusNotReachable && self.isEnabledNotNetworkState == YES) {
        self.notNetworkView = [SHNNotNetWorkView notNetWorkViewWithSuperView:self.view];
        self.notNetworkView.delegate = self;
    }
    
    
}
#pragma mark ---SHNNotNetWorkViewDelegate(断网重试)---
- (void)notNetWorkViewDidTryNetWork:(SHNNotNetWorkView *)notNetWorkView {
    
    ReachabilityStatus status = [[RealReachability sharedInstance] currentReachabilityStatus];
    if (status != RealStatusNotReachable) {
        self.isNotNetworkState = NO;
        
        [self getChannelData];
    } else {
        self.isNotNetworkState = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
