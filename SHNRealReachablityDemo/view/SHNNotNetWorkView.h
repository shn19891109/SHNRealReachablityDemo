//
//  SHNNotNetWorkView.h
//  SHNRealReachablityDemo
//
//  Created by 苏浩楠 on 16/2/24.
//  Copyright © 2016年 suhaonan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHNNotNetWorkView;
@protocol SHNNotNetWorkViewDelegate <NSObject>

@optional
//断网重试
- (void)notNetWorkViewDidTryNetWork:(SHNNotNetWorkView *)notNetWorkView;
@end

@interface SHNNotNetWorkView : UIView

/**
 *  断网重试代理对象
 */
@property (nonatomic,assign) id <SHNNotNetWorkViewDelegate> delegate;

/**
 *   给定一个父视图创建断网背景图
 *
 *  @param superView 父视图
 *
 *  @return  断网背景图对象
 */
+ (SHNNotNetWorkView *)notNetWorkViewWithSuperView:(UIView *)superView;
@end
