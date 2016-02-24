//
//  SHNBaseViewController.h
//  SHNRealReachablityDemo
//
//  Created by 苏浩楠 on 16/2/24.
//  Copyright © 2016年 suhaonan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SHNNotNetWorkView;

@interface SHNBaseViewController : UIViewController
/**
 *  断网背景图
 */
@property (nonatomic,strong) SHNNotNetWorkView *notNetworkView;
/**
 *  是否处于断网状态
 */
@property (nonatomic,assign) BOOL isNotNetworkState;
/**
 *  是否允许出现断网状态
 */
@property (nonatomic,assign) BOOL isEnabledNotNetworkState;

/**
 *  请求数据
 */
- (void)getChannelData;
@end
