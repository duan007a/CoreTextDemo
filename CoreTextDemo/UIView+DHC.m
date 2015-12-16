//
//  UIView+DHC.m
//  CoreTextDemo
//
//  Created by runsheng on 15/12/16.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "UIView+DHC.h"

@implementation UIView (DHC)

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (CGFloat)right
{
    return self.frame.origin.x+self.width;
}

- (void)setRight:(CGFloat)right
{
    self.frame = CGRectMake(right-self.width, self.top, self.width, self.height);
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}

- (CGFloat)bottom
{
    return self.frame.origin.y+self.height;
}

- (void)setBottom:(CGFloat)bottom
{
    self.frame = CGRectMake(self.left, bottom-self.height, self.width, self.height);
}

- (CGFloat)centerX
{
    return self.frame.origin.x+self.width/2;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.frame = CGRectMake(centerX-self.width/2, self.top, self.width, self.height);
}

- (CGFloat)centerY
{
    return self.frame.origin.y+self.height/2;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.frame = CGRectMake(self.left, centerY-self.height/2, self.width, self.height);
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setWidth:(CGFloat)width
{
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

@end
