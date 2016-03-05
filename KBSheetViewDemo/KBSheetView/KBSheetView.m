//
//  KBPopView.m
//  KBPopViewDemo
//
//  Created by KentonYu on 16/3/5.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import "KBSheetView.h"

static const CGFloat kAnimateWithDuration  = 0.3f;
static const CGFloat kDefalutMaskViewAlpha = 0.3f;

@interface KBSheetView ()

@property (nonatomic, strong) UIView    *contentView;
@property (nonatomic, strong) UIControl *maskControl;

@end

@implementation KBSheetView

- (instancetype)init {
    self = [self initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
      [self p_init];
    }
    return self;
}

#pragma mark Pravite
- (void)p_init {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [self p_addSubViews];
}

- (void)p_addSubViews {
    self.maskControl                 = [[UIControl alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.maskControl.backgroundColor = [UIColor blackColor];
    self.maskControl.alpha           = 0;  //alpha=0 不响应事件
    [self.maskControl addTarget:self action:@selector(p_dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.maskControl];

    self.contentView                 = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.frame           = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0);
    [self addSubview:self.contentView];
}

- (void)p_addCustomContentView:(UIView *)customView {
    CGSize customViewSize  = customView.frame.size;
    CGRect orignFrame      = self.contentView.frame;
    orignFrame.size.height = customViewSize.height;
    self.contentView.frame = orignFrame;
    [self.contentView addSubview:customView];
}

- (void)p_show {
    if(!self.superview){
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        CGRect contentViewFrame = self.contentView.frame;
        contentViewFrame        = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-contentViewFrame.size.height, contentViewFrame.size.width, contentViewFrame.size.height);
        self.contentView.frame  = contentViewFrame;
        self.maskControl.alpha  = self.maskViewAlpha?:kDefalutMaskViewAlpha;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)p_dismiss:(UIControl *)sender {
    [UIView animateWithDuration:kAnimateWithDuration animations:^{
        CGRect orignFrame      = self.contentView.frame;
        self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, orignFrame.size.height);
        self.maskControl.alpha  = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

#pragma mark Public
- (void)addCustomContentView:(UIView *)contentView {
    [self p_addCustomContentView:contentView];
}

- (void)show {
    [self p_show];
}

- (void)dismiss {
    [self p_dismiss:nil];
}
@end
