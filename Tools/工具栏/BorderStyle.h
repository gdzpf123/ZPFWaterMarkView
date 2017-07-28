//
//  BorderStyle.h
//  DaiDianSha
//
//  Created by PF Z on 2017/7/13.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BorderStyle : NSObject

//描边
@property (nonatomic,assign) float  borderAlpha;
@property (nonatomic,assign) int  borderWidth;
@property (nonatomic,strong) UIColor *borderColor;

@end
