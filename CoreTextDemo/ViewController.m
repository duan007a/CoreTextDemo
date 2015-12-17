//
//  ViewController.m
//  CoreTextDemo
//
//  Created by runsheng on 15/11/30.
//  Copyright © 2015年 润生. All rights reserved.
//

#import "ViewController.h"
#import "CTDisplayView.h"
#import "CTFrameParserConfig.h"
#import "CTFrameParser.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CTDisplayView *ctDisplayView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTFrameParserConfig *config = [CTFrameParserConfig new];
    CoreTextData *data = [CTFrameParser parseContent:@"Hello World! "
                          " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                          " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                          " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                          " 测试设置不同的绘制区域带来的界面变化。" config:config];
    self.ctDisplayView.data = data;
    self.ctDisplayView.height = data.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
