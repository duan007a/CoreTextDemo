//
//  CoreTextData.m
//  CoreTextDemo
//
//  Created by runsheng on 15/12/16.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "CoreTextData.h"
#import "CoreTextImageData.h"

@implementation CoreTextData

- (void)setCtFrame:(CTFrameRef)ctFrame
{
    if (_ctFrame != ctFrame)
    {
        if (_ctFrame != NULL)
        {
            CFRelease(_ctFrame);
        }
        CFRetain(ctFrame);
        _ctFrame = ctFrame;
    }
}

- (void)setImageArray:(NSMutableArray *)imageArray
{
    _imageArray = imageArray;
    
}

- (void)fillImagePosition
{
    if (self.imageArray.count == 0)
    {
        return;
    }
    NSArray *lines = (NSArray *)CTFrameGetLines(self.ctFrame);
    NSUInteger lineCount = lines.count;
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(self.ctFrame, CFRangeMake(0, 0), lineOrigins);
    
    CoreTextImageData *imageData = self.imageArray[0];
    for (int i = 0; i < lineCount; ++i)
    {
        if (imageData == nil)
        {
            break;
        }
        CTLineRef line = (__bridge CTLineRef)lines[i];
        NSArray * runObjArray = (NSArray *)CTLineGetGlyphRuns(line);
        for (id runObj in runObjArray) {
            CTRunRef run = (__bridge CTRunRef)runObj;
            NSDictionary *runAttributes = (NSDictionary *)CTRunGetAttributes(run);
            CTRunDelegateRef delegate = (__bridge CTRunDelegateRef)[runAttributes valueForKey:(id)kCTRunDelegateAttributeName];
            if (delegate == nil) {
                continue;
            }
            
            NSDictionary * metaDic = CTRunDelegateGetRefCon(delegate);
            if (![metaDic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            
            CGRect runBounds;
            CGFloat ascent;
            CGFloat descent;
            runBounds.size.width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
            runBounds.size.height = ascent + descent;
            
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            runBounds.origin.x = lineOrigins[i].x + xOffset;
            runBounds.origin.y = lineOrigins[i].y;
            runBounds.origin.y -= descent;
            
            CGPathRef pathRef = CTFrameGetPath(self.ctFrame);
            CGRect colRect = CGPathGetBoundingBox(pathRef);
            
            CGRect delegateBounds = CGRectOffset(runBounds, colRect.origin.x, colRect.origin.y);
            
            imageData.imagePosition = delegateBounds;
            imgIndex++;
            if (imgIndex == self.imageArray.count) {
                imageData = nil;
                break;
            } else {
                imageData = self.imageArray[imgIndex];
            }
        }
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
