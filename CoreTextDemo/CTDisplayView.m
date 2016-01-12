//
//  CTDisplayView.m
//  CoreTextDemo
//
//  Created by runsheng on 15/12/15.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
#import "CoreTextImageData.h"

@implementation CTDisplayView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.f, -1.f);
    
    if (self.data)
    {
        CTFrameDraw(self.data.ctFrame, context);
        for (CoreTextImageData *imageData in self.data.imageArray)
        {
            UIImage *image = [UIImage imageNamed:imageData.name];
            if (image)
            {
                CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
            }
        }
    }
}

@end
