//
//  SetBorderView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "SetBorderToolView.h"

@implementation SetBorderToolView
{
    
    LineSliderView *lineSlider;
    StepSliderView *stepSlider;
    PickColorView *colorView;
    

}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame=CGRectMake(0, 0, iphone_height_fit(1010), iphone_height_fit(720));
        
        self.borderStyle=[[BorderStyle alloc] init];
        
        lineSlider=[[LineSliderView alloc] initWithFrame:CGRectMake(0, 0, self.width, iphone_height_fit(125))];
        [lineSlider setSliderInitalValue:0.0];
        lineSlider.delegate=self;
        [self addSubview:lineSlider];
        
        stepSlider=[[StepSliderView alloc] initWithFrame:CGRectMake(0, iphone_height_fit(165), self.width, iphone_height_fit(125)) stepTitlesArr:@[@"0号",@"1号",@"2号",@"3号",@"4号",@"5号"] selIndex:0];
        stepSlider.title=@"宽度";
        stepSlider.delegate=self;
        [self addSubview:stepSlider];
        
        colorView=[[PickColorView alloc] initWithFrame:CGRectMake(0, self.height -iphone_height_fit(380) , self.width,iphone_height_fit(380)) ];
        colorView.delegate=self;
        [self addSubview:colorView];
        colorView.y=self.height-colorView.height;
        

    }
    return self;
}

-(void)didChangeSliderValue:(float)val
{
    self.borderStyle.borderAlpha=val;
    [self postBorderNotification];

}

-(void)didChangeStepSliderValue:(NSInteger)stepIndex
{
    self.borderStyle.borderWidth=(int)stepIndex;
    [self postBorderNotification];

}

-(void)didPickColor:(UIColor *)color
{
    self.borderStyle.borderColor=color;
    [self postBorderNotification];
}

-(void)postBorderNotification
{
    
    [NOTIFICATIONCENTER postNotificationName:WATER_MARK_VIEW_BORDER_STYLE_NOTIFICATION object:self.borderStyle];
    
}


@end
