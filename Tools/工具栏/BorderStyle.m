//
//  BorderStyle.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/13.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "BorderStyle.h"

@implementation BorderStyle

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.borderAlpha=1.0;
        self.borderWidth=0;
        self.borderColor=[UIColor clearColor];
        
    }
    return self;
}

@end
