//
//  SetZiTiToolView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextStyleView.h"
#import "ZitiStyle.h"

@interface SetZiTiToolView : UIView<TextStyleViewDelegate>

@property (nonatomic,strong) ZitiStyle *ZiTi;

@end
