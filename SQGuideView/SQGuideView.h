//
//  SQGuideView.h
//  SQGuideView
//
//  Created by SNQU on 2017/3/22.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQPageControl.h"

@class SQGuideView;


typedef void(^SQGuideViewSelectBlock)(NSInteger page);

@interface SQGuideView : UIView<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    SQPageControl *pageControl;
    NSArray *viewArr;
}
@property (nonatomic, strong) UIScrollView         *scrollView;
@property (nonatomic, strong) SQPageControl        *pageControl;
@property (nonatomic, strong) NSArray              *viewArr;//视图数组
@property (nonatomic, copy) SQGuideViewSelectBlock selectBlock;


/**
 默认样式的引导页,PageControl dot大小由总宽度和间距决定，默认颜色brownColor，选中颜色blackColor

 @param views 默认显示的界面
 */
- (void)updateDataWithViews:(NSArray*)views;

/**
 自定义界面的引导页

 @param views 引导页资源
 @param frame PageControl frame(只要是位置和宽度)
 @param pageStyle SQPageControlStyle 形状和样式
 @param space dot间距
 @param normalColor 正常颜色
 @param selectColor 选中颜色
 @param imageArray dot图片资源 当SQPageControlStyleImages模式下，不能为空数组
 */
- (void)updateDataWithViews:(NSArray*)views pageFrame:(CGRect)frame pageStyle:(SQPageControlStyle)pageStyle pageSpace:(CGFloat)space pageNormalColor:(UIColor *)normalColor pageselectedColor:(UIColor *)selectColor withImageArray:(NSMutableArray *)imageArray;

@end
