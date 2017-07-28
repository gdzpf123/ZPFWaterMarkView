//
//  WaterMarkImageView.m
//  DaiDianSha
//
//  Created by PF Z on 2017/7/11.
//  Copyright © 2017年 PF Z. All rights reserved.
//

#import "WaterMarkImageView.h"


@implementation WaterMarkImageView
{
    
    UIImageView *imgView;
    UILabel *titleLab;
    UIView *blankView;
    
    UIView *contextView;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.frame=CGRectMake(0, 0, iphone_height_fit(1010), iphone_height_fit(570));
        
        imgView=[[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imgView];
//        imgView.contentMode=UIViewContentModeScaleAspectFill;
        
        contextView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, iphone_height_fit(640), iphone_height_fit(120))];
        [self addSubview:contextView];
        contextView.centerX=self.width/2.0;
        contextView.y=iphone_height_fit(100);
        
        blankView=[[UIView alloc] initWithFrame:contextView.bounds];
        [contextView addSubview:blankView];
        blankView.backgroundColor=GetRGBCOLOR(225, 31, 70, 0.5);
      
        
        titleLab=[[UILabel alloc] initWithFrame:contextView.bounds];
        [contextView addSubview:titleLab];
        titleLab.center=blankView.center;
        titleLab.text=@"请输入内容";
        titleLab.textColor=[UIColor whiteColor];
        titleLab.font=GETFONT(15);

        
    }
    return self;
}



-(void)setImg:(UIImage *)img
{
    _img=img;
    imgView.image=img;
}

-(void)setMarkTitle:(NSString *)markTitle
{
    _markTitle=markTitle;
    titleLab.text=markTitle;
}


-(void)setBorderStyle:(BorderStyle *)style
{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat alpha = 0.0;
    [style.borderColor getRed:&red green:&green blue:&blue alpha:&alpha];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:(1-style.borderAlpha)];
    
    [blankView setRadious:0.0 borderWidth:style.borderWidth borderColor:newColor];
}

-(void)setbgColorStyle:(BgColorStyle *)style
{
    blankView.backgroundColor=style.backGroundColor;
    blankView.alpha=style.backGroundAlpha;
}

-(void)setTextColorStyle:(TextColorStyle *)style
{

    titleLab.textColor=style.textColor;
    titleLab.alpha=style.textAlpha;
    
}

-(void)setZitiStyle:(ZitiStyle *)style
{
    float fontSize=titleLab.font.pointSize;
    UIFont *font=[UIFont fontWithName:style.ziTiName size:fontSize];
    titleLab.font=font;
}

-(void)setZiHaoStyle:(ZiHaoStyle *)style
{
    titleLab.font=GETFONT(style.textFont);
    titleLab.textAlignment=style.textAlighment;
}

-(void)ImageShoot
{
    UIGraphicsBeginImageContextWithOptions(contextView.bounds.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [contextView.layer renderInContext:context];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    UIImage *waterImg=[self addToImage:imgView.image image:image];
    
    UIImageWriteToSavedPhotosAlbum(waterImg, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

//加图片水印
- (UIImage *)addToImage:(UIImage *)img image:(UIImage *)newImage
{
    int w = img.size.width;
    int h = img.size.height;
    
    //横图
    int w1=w*0.7;
    //竖图
    if (w>h) {
        w1=w*0.5;
    }
    
    int h1=w1*newImage.size.height/newImage.size.width;
    CGRect rect=CGRectMake( (w-w1)/2.0 ,  h*0.1, w1, h1);
    
    UIGraphicsBeginImageContext(img.size);
    [img drawInRect:CGRectMake(0, 0, w, h)];
    [newImage drawInRect:rect];
    
    UIImage *aimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return aimg;
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
//    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);

//    if (!error) {
//        NSLog(@"保存成功");
//    }else{
//        
//    }
    
}




@end
