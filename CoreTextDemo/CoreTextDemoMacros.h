//
//  CoreTextDemoMacros.h
//  CoreTextDemo
//
//  Created by runsheng on 15/12/16.
//  Copyright © 2015年 润生. All rights reserved.
//

#ifndef CoreTextDemoMacros_h
#define CoreTextDemoMacros_h

#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif

#define RGB(A, B, C)    [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]

#endif /* CoreTextDemoMacros_h */
