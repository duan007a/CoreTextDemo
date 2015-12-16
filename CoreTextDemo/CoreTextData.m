//
//  CoreTextData.m
//  CoreTextDemo
//
//  Created by runsheng on 15/12/16.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "CoreTextData.h"

@implementation CoreTextData

- (void)setCtFrame:(CTFrameRef)ctFrame
{
    if (_ctFrame != ctFrame)
    {
        if (_ctFrame != NULL)
        {
            CFRelease(_ctFrame);
        }
        CFRetain(_ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)dealloc
{
    if (_ctFrame)
    {
        CFRelease(_ctFrame);
        _ctFrame = NULL;
    }
}

@end
