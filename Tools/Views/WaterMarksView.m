//
//  WaterMarksView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "WaterMarksView.h"

@implementation WaterMarksView
{
    
    UIScrollView *_scrollView;
 
    NSMutableArray *_waterMarkImgViewsArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, iphone_height_fit(680));
        _scrollView=[[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.backgroundColor=Color_TableView_Default_Bg;
        _scrollView.pagingEnabled=YES;
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.backgroundColor=TableView_LightGray_BG;
        _scrollView.delegate=self;
        [self addSubview:_scrollView];
    }
    return self;
}

-(void)setWaterMarkImgsArr:(NSArray *)waterMarkImgsArr
{
    _waterMarkImgsArr=waterMarkImgsArr;
    for (WaterMarkImageView *imgView in _scrollView.subviews) {
        [imgView removeFromSuperview];
    }
    
    _scrollView.contentSize=CGSizeMake(self.width*waterMarkImgsArr.count, self.height);
    self.curMarkIndex=0;
    
    _waterMarkImgViewsArr=[NSMutableArray array];
    
    for (int i=0; i<waterMarkImgsArr.count; i++) {
        
        UIImage *img=waterMarkImgsArr[i];
        WaterMarkImageView *imgView=[[WaterMarkImageView alloc] init];
        imgView.img=img;
        
        [_scrollView addSubview:imgView];
        imgView.centerX=self.width*i+self.width/2.0;
        imgView.centerY=self.height/2.0;
        
        [_waterMarkImgViewsArr addObject:imgView];
    }
    
}


//设置加水印的文字
-(void)setWaterMakrText:(NSString *)text
{
    NSInteger index=self.curMarkIndex;
    WaterMarkImageView *markView=_waterMarkImgViewsArr[index];
    markView.markTitle=text;

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index=scrollView.contentOffset.x/scrollView.width;
    if (scrollView.contentOffset.x < scrollView.width) {
        index=0;
    }
    self.curMarkIndex=index;
    
}

//添加通知监听
-(void)addNotificationObserve
{
    [NOTIFICATIONCENTER addObserver:self selector:@selector(setBorderYangShi:) name:WATER_MARK_VIEW_BORDER_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(setBgColorYangShi:) name:WATER_MARK_VIEW_BGCOLOR_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(setTextColorYangShi:) name:WATER_MARK_VIEW_TEXTCOLOR_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(setZiTiYangShi:) name:WATER_MARK_VIEW_ZITI_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER addObserver:self selector:@selector(setZiHaoYangShi:) name:WATER_MARK_VIEW_ZIHAO_STYLE_NOTIFICATION object:nil];


}
//移除通知监听
-(void)removeNotificationObserve
{
    [NOTIFICATIONCENTER removeObserver:self name:WATER_MARK_VIEW_BORDER_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER removeObserver:self name:WATER_MARK_VIEW_BGCOLOR_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER removeObserver:self name:WATER_MARK_VIEW_TEXTCOLOR_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER removeObserver:self name:WATER_MARK_VIEW_ZITI_STYLE_NOTIFICATION object:nil];
    [NOTIFICATIONCENTER removeObserver:self name:WATER_MARK_VIEW_ZIHAO_STYLE_NOTIFICATION object:nil];

}

-(void)saveImagesWithFinishBlock:(void(^)(void))finish
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (int i=0; i<_waterMarkImgViewsArr.count; i++) {
            WaterMarkImageView *imgView=_waterMarkImgViewsArr[i];
            [imgView ImageShoot];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finish) {
                finish();
            }

        });
    });
    
    
}



#pragma mark ---------设置样式
-(void)setBorderYangShi:(NSNotification *)notification
{
    for (WaterMarkImageView * imgView in _waterMarkImgViewsArr) {
        [imgView setBorderStyle:notification.object];
    }
    
}

-(void)setBgColorYangShi:(NSNotification *)notification
{
    for (WaterMarkImageView * imgView in _waterMarkImgViewsArr) {
        [imgView setbgColorStyle:notification.object];
    }
    
}

-(void)setTextColorYangShi:(NSNotification *)notification
{
    for (WaterMarkImageView * imgView in _waterMarkImgViewsArr) {
        [imgView setTextColorStyle:notification.object];
    }
    
}

-(void)setZiTiYangShi:(NSNotification *)notification
{
    for (WaterMarkImageView * imgView in _waterMarkImgViewsArr) {
        [imgView setZitiStyle:notification.object];
    }
    
}

-(void)setZiHaoYangShi:(NSNotification *)notification
{
    for (WaterMarkImageView * imgView in _waterMarkImgViewsArr) {
        [imgView setZiHaoStyle:notification.object];
    }
    
}


@end
