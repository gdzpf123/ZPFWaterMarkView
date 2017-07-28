//
//  WaterMarkToolView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetBorderToolView.h"
#import "SetZiTiToolView.h"
#import "SetColorToolView.h"
#import "SetZiHaoToolView.h"
#import "SubItemsView.h"
#import "CommonField.h"

@protocol WaterMarkToolsViewDelegate <NSObject>

//修改文本代理
-(void)didChangeText:(NSString *)text;


@end

@interface WaterMarkToolsView : UIView<DidSelectItemDelegate,CommonFieldDelegate>

@property (nonatomic,assign) id<WaterMarkToolsViewDelegate>delegate;

@end
