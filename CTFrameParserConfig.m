//
//  CTFrameParserConfig.m
//  CoreTextDemo
//
//  Created by runsheng on 15/12/16.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (instancetype)init
{
    if (self = [super init]) {
        _width = 200.f;
        _fontSize = 16.f;
        _lineSpace = 8.f;
        _textColor = RGB(51.f, 51.f, 51.f);
    }
    return self;
}

@end
