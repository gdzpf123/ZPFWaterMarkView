//
//  WaterMarkImageView.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/11.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterMarkImageModel.h"


@interface WaterMarkImageView : UIView

@property (nonatomic,strong) UIImage *img;
@property (nonatomic,copy) NSString *markTitle;

-(void)setBorderStyle:(BorderStyle *)style;
-(void)setbgColorStyle:(BgColorStyle *)style;
-(void)setTextColorStyle:(TextColorStyle *)style;
-(void)setZitiStyle:(ZitiStyle *)style;
-(void)setZiHaoStyle:(ZiHaoStyle *)style;

//截图保存到本地
-(void)ImageShoot;

@end
