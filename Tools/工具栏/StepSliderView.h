//
//  StepSliderView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StepSliderDelegate <NSObject>

-(void)didChangeStepSliderValue:(NSInteger)stepIndex;

@end


@interface StepSliderView : UIView

@property (nonatomic,assign) id<StepSliderDelegate>delegate;

@property (nonatomic,copy) NSString *title;

- (instancetype)initWithFrame:(CGRect)frame stepTitlesArr:(NSArray *)arr selIndex:(int)index;


@end
