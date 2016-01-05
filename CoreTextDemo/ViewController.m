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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content" ofType:@"json"];
    
    CTFrameParserConfig *config = [CTFrameParserConfig new];
    CoreTextData *data = [CTFrameParser parseTemplateFile:path config:config];
    self.ctDisplayView.data = data;
    self.ctDisplayView.height = data.height;
    
    self.ctDisplayView.centerX = self.view.width/2;
    self.ctDisplayView.centerY = self.view.height/2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
