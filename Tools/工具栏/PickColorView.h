//
//  PickColorView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickColorViewDelegate <NSObject>

-(void)didPickColor:(UIColor *)color;

@end

@interface PickColorView : UIView

@property (nonatomic,assign) id<PickColorViewDelegate>delegate;

-(void)setSelectIndex:(int)index;

@end
