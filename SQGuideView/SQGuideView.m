//
//  SQGuideView.m
//  SQGuideView
//
//  Created by SNQU on 2017/3/22.
//  Copyright © 2017年 SNQU. All rights reserved.
//

#import "SQGuideView.h"
#import "SQPageControl.h"


#define kNumberOfPages viewArr.count?viewArr.count:1
#define kWidth         self.frame.size.width
#define kHight         self.frame.size.height

@implementation SQGuideView

@synthesize scrollView, pageControl, viewArr;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.backgroundColor = [UIColor whiteColor];
        scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        [self addSubview:scrollView];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.scrollsToTop = YES;
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
    }
    return self;
}

- (void)updateDataWithViews:(NSArray*)views
{
    //设置scrollView
    NSInteger index = views.count?views.count:1;
    scrollView.contentSize = CGSizeMake(kWidth * index, 0);
    for (NSInteger i = 0; i < index; i ++) {
        UIView *itemView = views[i];
        [scrollView addSubview:itemView];
    }
    //设置pageControl
    pageControl = [[SQPageControl alloc] initWithFrame:CGRectMake(100, kHight-60, kWidth-200, 0) pageStyle:SQPageControlStyleDefaoult withImageArray:[NSMutableArray arrayWithCapacity:1]];
    pageControl.selectedColor = [UIColor blackColor];
    pageControl.pageBackgroundColor = [UIColor brownColor];
    pageControl.pageNumber = index;
    pageControl.currentPageNumber = 0;
    [self addSubview:pageControl];
}

- (void)updateDataWithViews:(NSArray*)views pageFrame:(CGRect)frame pageStyle:(SQPageControlStyle)pageStyle pageSpace:(CGFloat)space pageNormalColor:(UIColor *)normalColor pageselectedColor:(UIColor *)selectColor withImageArray:(NSMutableArray *)imageArray
{
    //设置scrollView
    NSInteger index = views.count?views.count:1;
    scrollView.contentSize = CGSizeMake(kWidth * index, 0);
    for (NSInteger i = 0; i < index; i ++) {
        UIView *itemView = views[i];
        [scrollView addSubview:itemView];
    }
    //设置pageControl
    pageControl = [[SQPageControl alloc] initWithFrame:frame pageStyle:pageStyle withImageArray:imageArray];
    pageControl.selectedColor = selectColor;
    pageControl.pageBackgroundColor = normalColor;
    pageControl.pageSpace = space;
    pageControl.pageNumber = index;
    pageControl.currentPageNumber = 0;
    [self addSubview:pageControl];
}

- (UIView *)view
{
    return scrollView;
}


-(void)goAction:(id)sender
{
    [self dismissAnimation];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
    NSInteger page = scrollView.contentOffset.x / kWidth;
    pageControl.currentPageNumber = page;
    NSLog(@"scrollView.contentOffset.x = %f,scrollView.contentOffset.y = %f ", scrollView.contentOffset.x, scrollView.contentOffset.y);
    if (self.selectBlock) {
        self.selectBlock(page);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    if (scrollView.contentOffset.x > 3.2 * kWidth) {
        [self dismissAnimation];
    }
}


-(void)dismissAnimation
{
    [UIView beginAnimations:@"fadeOut" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissAnimationEnd)];
    self.alpha = 0;
    [UIView commitAnimations];
    
}


-(void)dismissAnimationEnd
{
    [self removeFromSuperview];
}

@end
