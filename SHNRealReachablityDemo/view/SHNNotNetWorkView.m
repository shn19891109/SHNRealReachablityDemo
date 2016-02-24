//
//  SHNNotNetWorkView.m
//  SHNRealReachablityDemo
//
//  Created by 苏浩楠 on 16/2/24.
//  Copyright © 2016年 suhaonan. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "SHNNotNetWorkView.h"
#import "Masonry.h"


@implementation SHNNotNetWorkView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kUIColorFromRGB(0xf2f2f2);
        
        UIImageView *notNetWorkImgView = [[UIImageView alloc] init];
        [self addSubview:notNetWorkImgView];
        notNetWorkImgView.image = kImageNamed(@"ico_notNetwork_flag");
        notNetWorkImgView.frame = CGRectMake((kScreenWidth - 199) / 2, (frame.size.height - 102) / 2, 199, 102);
        [notNetWorkImgView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
     
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake((kScreenWidth - 140) / 2, CGRectGetMaxY(notNetWorkImgView.frame)+60, 140, 45);
        [btn setTitle:@"重试" forState:UIControlStateNormal];
        [btn setTitleColor:kUIColorFromRGB(0xf70800) forState:UIControlStateNormal];
        btn.layer.borderColor = kUIColorFromRGB(0xf70800).CGColor;
        btn.layer.borderWidth = 1;
        btn.layer.cornerRadius = 5;
        btn.layer.masksToBounds = YES;
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin];
        [btn addTarget:self action:@selector(tryNetwork) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    
    }
    return self;
}
#pragma mark ---断网重试--
- (void)tryNetwork {
    if (self.delegate && [self.delegate respondsToSelector:@selector(notNetWorkViewDidTryNetWork:)]) {
        [self.delegate notNetWorkViewDidTryNetWork:self];
    }
}
//创建
+ (SHNNotNetWorkView *)notNetWorkViewWithSuperView:(UIView *)superView {
    SHNNotNetWorkView *notWorkView = [[SHNNotNetWorkView alloc] initWithFrame:superView.bounds];
    [superView addSubview:notWorkView];
    [notWorkView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin];
    return notWorkView;
}
@end
