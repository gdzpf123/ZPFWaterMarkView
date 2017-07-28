//
//  SetColorToolView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineSliderView.h"
#import "PickColorView.h"

#import "TextColorStyle.h"
#import "BgColorStyle.h"

typedef enum {
    TextColor,
    BgColor,
}ColorType;

@interface SetColorToolView : UIView<LineSliderDelegate,PickColorViewDelegate>

@property (nonatomic,assign) ColorType type;

@property (nonatomic,strong) TextColorStyle *textColor; //文字颜色
@property (nonatomic,strong) BgColorStyle *bgColor;    //背景颜色

@end
