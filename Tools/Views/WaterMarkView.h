//
//  WaterMarkView.h
//  DragBtnDemo
//
//  Created by PF Z on 2017/7/4.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterMarkItem.h"
//加水印的View

@interface WaterMarkView : UIView

-(void)inserWaterMark:(WaterMarkItem *)item;

//添加一个文字水印
-(void)addTextWaterMark;

- (instancetype)initWithImage:(UIImage *)img;

- (UIImage *)screenshot;


@end
