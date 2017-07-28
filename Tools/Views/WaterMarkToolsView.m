//
//  WaterMarkToolView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/12.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "WaterMarkToolsView.h"

@implementation WaterMarkToolsView
{
    UIScrollView *scrollView;
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-iphone_height_fit(680)-kTitleBarHeight );
        self.backgroundColor=[UIColor whiteColor];
        
        NSArray *titlesArr=@[@"字号",@"字体",@"颜色",@"背景色",@"描边"];
        
        UIView *lineView1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1.5)];
        [self addSubview:lineView1];
        lineView1.backgroundColor=SplitLine_BG;

        
        
        UIView *blankView=[[UIView alloc] initWithFrame:CGRectMake(0, iphone_height_fit(40), iphone_height_fit(1010), iphone_height_fit(100))];
        [self addSubview:blankView];
        [blankView setRadious:5];
        blankView.backgroundColor=TableView_LightGray_BG;
        blankView.centerX=SCREEN_WIDTH/2.0;
        CommonField *field=[[CommonField alloc] init];
        [blankView addSubview:field];
        field.fieldDelegate=self;
        [field mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(blankView.mas_left).with.offset(Radious_CELL_Inside_SPACE);
            make.right.mas_equalTo(blankView.mas_right).with.offset(-Radious_CELL_Inside_SPACE);
            make.top.mas_equalTo(blankView.mas_top).with.offset(2);
            make.bottom.mas_equalTo(blankView.mas_bottom).with.offset(-2);
        }];

        
        SubItemsView *itemsView=[[SubItemsView alloc] initWithItemNames:titlesArr selectColor:Common_Red_color hideBottomLine:YES];
        [self addSubview:itemsView];
        itemsView.centerY=iphone_height_fit(188);
        itemsView.delegate=self;
        
        [self bringSubviewToFront:blankView];

        
        UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, iphone_height_fit(250)-2, SCREEN_WIDTH, 1.5)];
        [self addSubview:lineView];
        lineView.backgroundColor=SplitLine_BG;
        [self bringSubviewToFront:lineView];
        
        scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, iphone_height_fit(250), self.width, self.height-iphone_height_fit(250))];
        scrollView.contentSize=CGSizeMake(self.width*5, scrollView.height);
        scrollView.backgroundColor=[UIColor whiteColor];
        scrollView.pagingEnabled=YES;
        scrollView.showsVerticalScrollIndicator=NO;
        scrollView.showsHorizontalScrollIndicator=NO;
        scrollView.scrollEnabled=NO;
        [self addSubview:scrollView];
        
        
        SetZiHaoToolView *zihaoView=[[SetZiHaoToolView alloc] init];
        [scrollView addSubview:zihaoView];
        zihaoView.centerX=self.width/2.0;
        zihaoView.y=iphone_height_fit(105);
        
        SetZiTiToolView *zitiView=[[SetZiTiToolView alloc] init];
        [scrollView addSubview:zitiView];
        zitiView.centerX=self.width*3/2.0;
        zitiView.centerY=iphone_height_fit(400);
        
        SetColorToolView *textColorView=[[SetColorToolView alloc] init];
        textColorView.type=TextColor;
        [scrollView addSubview:textColorView];
        textColorView.centerX=self.width*5/2.0;
        textColorView.y=iphone_height_fit(100);
        
        SetColorToolView *bgColorView=[[SetColorToolView alloc] init];
        bgColorView.type=BgColor;
        [scrollView addSubview:bgColorView];
        bgColorView.centerX=self.width*7/2.0;
        bgColorView.y=iphone_height_fit(100);
        
        SetBorderToolView *borderView=[[SetBorderToolView alloc] init];
        [scrollView addSubview:borderView];
        borderView.centerX=self.width*9/2.0;
        borderView.y=iphone_height_fit(40);
        
        
    }
    return self;
}

#pragma mark ---------SubItemsViewDelegate
-(void)didSelectItem:(NSString *)itemName selIndex:(NSInteger)index
{
    
    scrollView.contentOffset=CGPointMake(self.width*index, 0);
    
    
}

#pragma mark ---------FieldDelegate
-(void)didChangeText:(NSString *)text textField:(UITextField *)field
{
    if (self.delegate) {
        [self.delegate didChangeText:text];
    }
    
}




@end
