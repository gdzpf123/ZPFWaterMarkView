//
//  SetBorderView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LineSliderView.h"
#import "StepSliderView.h"
#import "PickColorView.h"
#import "BorderStyle.h"


@interface SetBorderToolView : UIView<LineSliderDelegate,StepSliderDelegate,PickColorViewDelegate>

@property (nonatomic,strong) BorderStyle *borderStyle;


@end
