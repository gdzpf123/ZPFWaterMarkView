//
//  WaterMarkView.m
//  DragBtnDemo
//
//  Created by PF Z on 2017/7/4.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "WaterMarkView.h"

@implementation WaterMarkView
{
    
}
- (instancetype)initWithImage:(UIImage *)img
{
    self = [super init];
    if (self) {
        
        self.frame=CGRectMake(0, 0, 320-30, (320-20)*1220/950.0);
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:self.bounds];
        imgView.image=img;
        [self addSubview:imgView];
        imgView.backgroundColor=[UIColor orangeColor];
        
        
        
    }
    return self;
}

-(void)inserWaterMark:(WaterMarkItem *)item
{

    [self addSubview:item];
    
}

- (UIImage *)screenshot
{

    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return viewImage;
}

//添加一个文字水印
-(void)addTextWaterMark
{
    WaterMarkItem *item=[[WaterMarkItem alloc] initWithText:@"aksldasld"];
    CGFloat x=arc4random()%(int)(self.frame.size.width-item.frame.size.width);
    CGFloat y=arc4random()%(int)(self.frame.size.height-item.frame.size.height);
    
    item.frame=CGRectMake(x, y, item.frame.size.width, item.frame.size.height);
    
    [self inserWaterMark:item];
    
}



@end
