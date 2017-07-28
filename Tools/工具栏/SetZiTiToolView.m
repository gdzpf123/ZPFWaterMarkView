//
//  SetZiTiToolView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "SetZiTiToolView.h"
#import "TextStyleView.h"

@implementation SetZiTiToolView
{
    
    TextStyleView *btnsView;
    NSArray *ziTiArr;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.ZiTi=[[ZitiStyle alloc] init];
        self.frame=CGRectMake(0, 0, iphone_height_fit(1010), iphone_height_fit(250));
        ziTiArr=@[@"方正楷体",@"宋体",@"黑体",@"华文新体"];
        btnsView=[[TextStyleView alloc] initWithFrame:CGRectMake(0, 0, self.width, iphone_height_fit(125)) imgsArr:nil selImgsArr:nil orTitlesArr:ziTiArr selIndex:1000];
        [self addSubview:btnsView];
        btnsView.centerY=self.height/2.0;
        btnsView.delegate=self;
    }
    return self;
}


-(void)didSelStypeIndex:(int)index textStyleView:(UIView *)view
{
    //宋体---DFPSongW12
    //黑体---JHeiTi
    //楷体---FZKTJW--GB1-0
    //新体---STXinwei
    NSArray *zitiNamesArr=@[@"FZKTJW--GB1-0",@"DFPSongW12",@"JHeiTi",@"STXinwei"];
    NSString *ziti=zitiNamesArr[index];
    self.ZiTi.ziTiName=ziti;
    
    [self postBorderNotification];
}


-(void)postBorderNotification
{
    
    [NOTIFICATIONCENTER postNotificationName:WATER_MARK_VIEW_ZITI_STYLE_NOTIFICATION object:self.ZiTi];
    
}

@end
