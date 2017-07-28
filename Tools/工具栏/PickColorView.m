//
//  PickColorView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "PickColorView.h"
#import "WaterMarkColorsManager.h"

@implementation PickColorView
{
    UIView *selView;
    
    NSArray *colorsArr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor=TableView_LightGray_BG;
        [self setRadious:5];

        colorsArr=[[WaterMarkColorsManager getinstance] getAllWaterMarkColors];
        
        selView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, iphone_height_fit(85), iphone_height_fit(85))];
        [self addSubview:selView];
        [selView setRadious:selView.height/2.0 borderWidth:1.0 borderColor:[UIColor blackColor]];
        
        for (int i=0; i<colorsArr.count; i++) {
            
            UIColor *color=nil;

            color=colorsArr[i];
            
            UIButton *colorBtn=GETBTN;
            [self addSubview:colorBtn];
            colorBtn.tag=100+i;
            
            CGFloat centerX=(self.width/7)*(i%7) + (self.width/7)/2.0;
            CGFloat centerY=0;
            if (i/7==0) {
                centerY=iphone_height_fit(85);
            }else if (i/7==1){
                centerY=iphone_height_fit(195);
            }else{
                centerY=iphone_height_fit(307);
            }
            
            colorBtn.size=CGSizeMake(iphone_height_fit(67), iphone_height_fit(67));
            colorBtn.center=CGPointMake(centerX, centerY);
            [colorBtn setRadious:colorBtn.height/2.0];
            if (i==0) {
                UILabel *LAB=GETLAB;
                [colorBtn addSubview:LAB];
                LAB.font=GETFONT(13);
                LAB.text=@"无";
                LAB.textAlignment=NSTextAlignmentCenter;
                LAB.size=CGSizeMake(20, 20);
                LAB.centerX=colorBtn.width/2.0;
                LAB.centerY=colorBtn.height/2.0;
                colorBtn.backgroundColor=[UIColor whiteColor];
                
            }else{
                colorBtn.backgroundColor=color;
            }
            
            [colorBtn addTarget:self action:@selector(colorSel:) forControlEvents:UIControlEventTouchUpInside];
            
            if (i==0) {
                selView.center=colorBtn.center;
            }
            
            
        }

    }
    return self;
}

-(void)setSelectIndex:(int)index
{
    UIButton *btn=[self viewWithTag:100+index];
    selView.center=btn.center;
}


-(void)colorSel:(UIButton *)btn
{
    selView.center=btn.center;
    
    int index=(int)btn.tag-100;
    if (self.delegate) {
        [self.delegate didPickColor:colorsArr[index]];
    }
    
}



@end
