//
//  SetColorToolView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "SetColorToolView.h"

@implementation SetColorToolView
{
    
    LineSliderView *lineSlider;
    PickColorView *colorView;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame=CGRectMake(0, 0, iphone_height_fit(1010), iphone_height_fit(610));

        ;
    }
    return self;
}

-(void)setType:(ColorType)type
{
    _type=type;
    
    float alpVal=0.0;
    int colorIndex=0;
    if (type==TextColor) {
        self.textColor=[[TextColorStyle alloc] init];
        alpVal=0.0;
        colorIndex=1;
    }else{
        self.bgColor=[[BgColorStyle alloc] init];
        alpVal=0.5;
        colorIndex=8;
    }
    
    lineSlider=[[LineSliderView alloc] initWithFrame:CGRectMake(0, 0, self.width, iphone_height_fit(125))];
    [lineSlider setSliderInitalValue:alpVal];
    [self addSubview:lineSlider];
    lineSlider.delegate=self;
    
    colorView=[[PickColorView alloc] initWithFrame:CGRectMake(0, self.height -iphone_height_fit(380) , self.width,iphone_height_fit(380)) ];
    [colorView setSelectIndex:colorIndex];
    [self addSubview:colorView];
    colorView.y=self.height-colorView.height;
    colorView.delegate=self;

}

-(void)didChangeSliderValue:(float)val
{
    
        if (_type==TextColor) {
            self.textColor.textAlpha=1-val;
        }else{
            self.bgColor.backGroundAlpha=1-val;
        }
    
    [self postColorNotification];
}

-(void)didPickColor:(UIColor *)color
{
    if (_type==TextColor) {
        self.textColor.textColor=color;
    }else{
        self.bgColor.backGroundColor=color;
    }
    
    [self postColorNotification];
}


-(void)postColorNotification
{
    
    if (_type==TextColor) {
        [NOTIFICATIONCENTER postNotificationName:WATER_MARK_VIEW_TEXTCOLOR_STYLE_NOTIFICATION object:self.textColor];

    }else{
        [NOTIFICATIONCENTER postNotificationName:WATER_MARK_VIEW_BGCOLOR_STYLE_NOTIFICATION object:self.bgColor];

    }
    
}

@end
