//
//  SetTextFontToolView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "SetZiHaoToolView.h"


@implementation SetZiHaoToolView
{
    StepSliderView *stepSlider;

    TextStyleView *fontView;
    TextStyleView *alighmentView;
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.ziHao=[[ZiHaoStyle alloc] init];
        
        self.frame=CGRectMake(0, 0, iphone_height_fit(1010), iphone_height_fit(600));
        self.ziHao=[[ZiHaoStyle alloc] init];
        
        stepSlider=[[StepSliderView alloc] initWithFrame:CGRectMake(0, 0 , self.width, iphone_height_fit(125)) stepTitlesArr:@[@"13号",@"14号",@"15号",@"16号",@"17号",@"18号"] selIndex:1];
        [self addSubview:stepSlider];
        stepSlider.delegate=self;
        stepSlider.title=@"大小";
        
        NSArray *fontImgsArr=@[@"jiacu",@"qingxie",@"xianhuaxian"];
        NSArray *fontSelImgsArr=@[@"jiacu-lan",@"qingxie-lan",@"xiahuaxian-lan"];
        fontView=[[TextStyleView alloc] initWithFrame:CGRectMake(0, iphone_height_fit(230), self.width, iphone_height_fit(125)) imgsArr:fontImgsArr selImgsArr:fontSelImgsArr orTitlesArr:nil selIndex:1000];
        [self addSubview:fontView];
        fontView.delegate=self;
        
        NSArray *alighMentImgsArr=@[@"zuoduiqi",@"juzhongduiqi",@"youduiqi"];
        NSArray *alighMentSelImgsArr=@[@"zuoduiqi-lan",@"juzhongduiqi-lan",@"youduiqi-lan"];
        alighmentView=[[TextStyleView alloc] initWithFrame:CGRectMake(0, self.height-iphone_height_fit(125), self.width, iphone_height_fit(125)) imgsArr:alighMentImgsArr selImgsArr:alighMentSelImgsArr orTitlesArr:nil selIndex:0];
        [self addSubview:alighmentView];
        alighmentView.delegate=self;
        
        
    }
    return self;
}

-(void)didChangeStepSliderValue:(NSInteger)stepIndex
{
    float font=13+stepIndex;
    self.ziHao.textFont=font;
    
    [self postBorderNotification];

}

-(void)didSelStypeIndex:(int)index textStyleView:(UIView *)view
{
    if (view==fontView) {
        self.ziHao.style=index;
    }else{
        NSTextAlignment alighment=NSTextAlignmentLeft;
        switch (index) {
            case 0:
                alighment=NSTextAlignmentLeft;
                break;
            case 1:
                alighment=NSTextAlignmentCenter;
                break;
            case 2:
                alighment=NSTextAlignmentRight;
                break;
            default:
                break;
        }
        self.ziHao.textAlighment=alighment;
    }
    
    [self postBorderNotification];
}

-(void)postBorderNotification
{
    
    [NOTIFICATIONCENTER postNotificationName:WATER_MARK_VIEW_ZIHAO_STYLE_NOTIFICATION object:self.ziHao];
    
}

@end
