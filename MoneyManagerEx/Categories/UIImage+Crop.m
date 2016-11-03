//
//  UIImage+Crop.m
//  MoneyManagerEx
//
//  Created by taotao on 2016/11/2.
//  Copyright © 2016年 taotao. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)circleImage
{
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    CGFloat r = w;
    
    CGImageRef cropImageRef = self.CGImage;
    if (w > h) {
        cropImageRef = CGImageCreateWithImageInRect(self.CGImage, CGRectMake((w-h)/2, 0, h, h));
        r = h;
    }
    else if (h > w) {
        cropImageRef = CGImageCreateWithImageInRect(self.CGImage, CGRectMake(0, (h-w)/2, w, w));
        r = w;
    }
    CGRect frame = CGRectMake(0, 0, r, r);
    
    UIImage *cropImage = [UIImage imageWithCGImage:cropImageRef];
    UIGraphicsBeginImageContextWithOptions(frame.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:r] addClip];
    [cropImage drawInRect:frame];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
