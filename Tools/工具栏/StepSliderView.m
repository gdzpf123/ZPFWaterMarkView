//
//  StepSliderView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "StepSliderView.h"
#import "StepSizeSlider.h"

@implementation StepSliderView
{

    StepSizeSlider *slider2;
    
    UILabel *valueLab;
    UILabel *lab1;

    NSArray *valuesArr;
}

- (instancetype)initWithFrame:(CGRect)frame stepTitlesArr:(NSArray *)arr selIndex:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat labWidth=iphone_height_fit(170);

        
        self.backgroundColor=TableView_LightGray_BG;
        [self setRadious:5];

        valuesArr=arr;
        NSMutableArray *titlesArr=[NSMutableArray array];
        for (int i=0; i<arr.count; i++) {
            [titlesArr addObject:@""];
        }
        
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
        valueLab.text=arr[index];
        valueLab.font=GETFONT(14);
        valueLab.size=CGSizeMake(labWidth, 20);
        valueLab.x=self.width-labWidth;
        valueLab.centerY=self.height/2.0;
        valueLab.textAlignment=NSTextAlignmentCenter;

        slider2=[[StepSizeSlider alloc] initWithFrame:CGRectMake(0, 0, self.width - labWidth*2, 50)];
        slider2.thumbColor=Common_Red_color;
        slider2.lineWidth = 1;
        slider2.titleArray = titlesArr;
        slider2.titleOffset = 23;
        slider2.index = index;
        slider2.stepWidth = 5;
        slider2.sliderOffset = 0;
        slider2.stepTouchRate = 2;
        slider2.thumbSize = CGSizeMake(20, 20);
        slider2.thumbTouchRate = 2;
        slider2.continuous = NO;
        slider2.stepColor=[UIColor blackColor];
        slider2.lineColor=[UIColor blackColor];
        [slider2 addTarget:self action:@selector(valueChangeAction:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:slider2];
        slider2.centerX=self.width/2.0;
        slider2.centerY=self.height/2.0;
        slider2.backgroundColor=[UIColor clearColor];
        
    }
    return self;
}


-(void)setTitle:(NSString *)title
{
    _title=title;
    lab1.text=title;
    
}

- (void)valueChangeAction:(StepSizeSlider *)sender {
    
    valueLab.text=valuesArr[sender.index];
    
    if (self.delegate) {
        [self.delegate didChangeStepSliderValue:sender.index];
    }
}

@end
