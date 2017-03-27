//
//  SQPageControl.h
//  SQGuideView
//
//  Created by SNQU on 2017/3/22.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 声明pageControl点的样式枚举
 */
typedef NS_ENUM(NSInteger,SQPageControlStyle)
{
    SQPageControlStyleDefaoult = 0,//默认类型:圆形
    SQPageControlStyleSquare,//正方形
    SQPageControlStyleImages //缩略图,自定义图片
};

@interface SQPageControl : UIView

@property(nonatomic, assign)NSInteger pageNumber;//点的个数
@property(nonatomic, assign)CGFloat pageSpace;//点的间隔
@property(nonatomic, strong)UIColor *pageBackgroundColor;//点的背景颜色
@property(nonatomic, strong)UIColor *selectedColor;//选中的背景色
@property(nonatomic, assign)NSInteger currentPageNumber;//当前点击的pageNumber
@property(nonatomic, assign)SQPageControlStyle pageStyle;//当前pageControl样式
@property(nonatomic, strong)NSMutableArray *imageArray;
//初始化方法
-(instancetype)initWithFrame:(CGRect)frame pageStyle:(SQPageControlStyle)pageStyle withImageArray:(NSMutableArray *)imageArray;

@end
