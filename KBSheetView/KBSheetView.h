//
//  KBPopView.h
//  KBPopViewDemo
//
//  Created by KentonYu on 16/3/5.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBSheetView : UIView

/**
 *  遮罩层透明度
 *  Defalut：0.3f
 */
@property (nonatomic, assign) CGFloat maskViewAlpha;

/**
 *  添加自定义视图
 *
 *  @param contentView 自定义视图
 */
- (void)addCustomContentView:(UIView *)contentView;

/**
 *  显示popView
 */
- (void)show;

/**
 *  隐藏popView
 */
- (void)dismiss;

@end
