//
//  WaterMarksView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterMarkImageView.h"

@interface WaterMarksView : UIView<UIScrollViewDelegate>


@property (nonatomic,strong) NSArray *waterMarkImgsArr;

//当前正在渲染的图片下标
@property (nonatomic,assign) NSInteger curMarkIndex;

//当工具栏的设置修改时，水印控件需要刷新一下模型重新渲染图片
-(void)refreshMarkModel:(WaterMarkImageModel *)model;

//设置加水印的文字
-(void)setWaterMakrText:(NSString *)text;


//添加通知监听
-(void)addNotificationObserve;
//移除通知监听
-(void)removeNotificationObserve;


-(void)saveImagesWithFinishBlock:(void(^)(void))finish;

@end
