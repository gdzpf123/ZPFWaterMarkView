//
//  LineSliderView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LineSliderDelegate <NSObject>

-(void)didChangeSliderValue:(float)val;

@end

@interface LineSliderView : UIView

@property (nonatomic,assign) id<LineSliderDelegate>delegate;

@property (nonatomic,copy) NSString *title;

-(void)setSliderInitalValue:(float)value;

@end
