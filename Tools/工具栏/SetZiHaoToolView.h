//
//  SetTextFontToolView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepSliderView.h"
#import "TextStyleView.h"
#import "ZiHaoStyle.h"

@interface SetZiHaoToolView : UIView<StepSliderDelegate,TextStyleViewDelegate>


@property (nonatomic,strong) ZiHaoStyle *ziHao;

@end
