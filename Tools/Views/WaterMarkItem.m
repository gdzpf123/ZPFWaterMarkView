//
//  WaterMarkItem.m
//  DragBtnDemo
//
//  Created by PF Z on 2017/7/4.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "WaterMarkItem.h"

@implementation WaterMarkItem

- (instancetype)initWithText:(NSString *)text
{
    self = [super init];
    if (self) {
        self.frame=CGRectMake(0, 0, 80, 40);
        
        self.backgroundColor=[UIColor redColor];
        
        UILabel *lab=[[UILabel alloc] initWithFrame:self.bounds];
        lab.text=text;
        lab.textColor=[UIColor whiteColor];
        lab.textAlignment=NSTextAlignmentCenter;
        [self addSubview:lab];
        
        UIButton *cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:cancelBtn];
        cancelBtn.backgroundColor=[UIColor greenColor];
        cancelBtn.frame=CGRectMake(self.frame.size.width-20, 0, 20, 20);
        [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        
        //拖拽
        UIPanGestureRecognizer * pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}


//点击事件
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"点击");
    
}

-(void)cancelClick
{
    [self removeFromSuperview];
}

#pragma mark - 拖拽移动
- (void) panAction:(UIPanGestureRecognizer *) pan
{
    //获取移动的大小
    CGPoint point=[pan translationInView:pan.view];
    //更改视图的中心点坐标
    CGPoint points=self.center;
    points.x+=point.x;
    points.y+=point.y;
    
    NSLog(@"x=%.2f , y=%.2f",points.x,points.y);
    
    CGSize size=self.superview.frame.size;
//    if ((points.x + self.frame.size.width/2.0) > size.width || (points.y+self.frame.size.height/2.0) >size.height || points.x<self.frame.size.width/2.0 ||  points.y<self.frame.size.height/2.0) {
//        return;
//    }
    if ((points.x + self.frame.size.width/2.0) > size.width) {
        
        points.x=size.width-self.frame.size.width/2.0;
        
    }else if ((points.y+self.frame.size.height/2.0) >size.height){
        
        points.y=size.height-self.frame.size.height/2.0;
        
    }else if (points.x<self.frame.size.width/2.0){
        
        points.x=self.frame.size.width/2.0;
        
    }else if (points.y<self.frame.size.height/2.0){
        
        points.y=self.frame.size.height/2.0;
        
    }
    
    self.center=points;
    //每次都清空一下，消除坐标叠加
    [pan setTranslation:CGPointZero inView:pan.view];
}


@end
