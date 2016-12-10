//
//  UIImage+BBVoiceRecord.m
//  BBVoiceRecordDemo
//
//  Created by 谢国碧 on 2016/12/10.
//
//

#import "UIImage+BBVoiceRecord.h"

@implementation UIImage (BBVoiceRecord)

+ (UIImage *)bb_imageWithColor:(UIColor *)color withSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, .0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [color set];
    CGContextFillRect(context, CGRectMake(.0, .0, size.width, size.height));
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
