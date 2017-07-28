//
//  LineSliderView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "LineSliderView.h"
#import "StepSizeSlider.h"


@implementation LineSliderView
{
    StepSizeSlider *slider1;
    
    UILabel *valueLab;
    UILabel *lab1;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat labWidth=iphone_height_fit(200);
        
        self.backgroundColor=TableView_LightGray_BG;
        [self setRadious:5];
        
        lab1=GETLAB;
        [self addSubview:lab1];
        lab1.text=@"透明度";
        lab1.font=GETFONT(14);
        lab1.size=CGSizeMake(labWidth, 20);
        lab1.x=0;
        lab1.centerY=self.height/2.0;
        lab1.textAlignment=NSTextAlignmentCenter;
        
        valueLab=GETLAB;
        [self addSubview:valueLab];
        valueLab.text=@"40%";
        valueLab.font=GETFONT(14);
        valueLab.size=CGSizeMake(labWidth, 20);
        valueLab.x=self.width-labWidth;
        valueLab.centerY=self.height/2.0;
        valueLab.textAlignment=NSTextAlignmentCenter;
        
        slider1=[[StepSizeSlider alloc] initWithFrame:CGRectMake(0, 0, self.width - labWidth*2 , 40)];
        slider1.value=0.4;
        slider1.thumbSize=CGSizeMake(20, 20);
        slider1.thumbColor=Common_Red_color;
        slider1.minimumValue=0.0;
        slider1.maximumValue=1.0;
        slider1.backgroundColor=[UIColor clearColor];
        slider1.stepColor=[UIColor blackColor];
        slider1.lineColor=[UIColor blackColor];
        slider1.minTrackColor=[UIColor blackColor];
        slider1.maxTrackColor=[UIColor blackColor];
        slider1.sliderOffset=0;
        slider1.continuous=YES;
        slider1.lineWidth = 1;
        slider1.type = CCHStepSizeSliderTypeNormal;
        slider1.lineColor=[UIColor blackColor];
        [slider1 addTarget:self action:@selector(valueChangeAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider1];
        slider1.centerX=self.width/2.0;
        slider1.centerY=self.height/2.0;
        
        
    }
    return self;
}

-(void)setSliderInitalValue:(float)value
{
    slider1.value=value;
    int percent=value*100;
    NSString *str=@"%";
    valueLab.text=[NSString stringWithFormat:@"%d%@",percent,str];
}

-(void)setTitle:(NSString *)title
{
    _title=title;
    lab1.text=title;
    
}

- (void)valueChangeAction:(StepSizeSlider *)sender {
    NSLog(@"sender :%@,value :%f,index :%ld",sender,sender.value,(long)sender.index);
    int percent=sender.value*100;
    NSString *str=@"%";
    valueLab.text=[NSString stringWithFormat:@"%d%@",percent,str];
    
    if (self.delegate) {
        [self.delegate didChangeSliderValue:sender.value];
    }
}

@end
