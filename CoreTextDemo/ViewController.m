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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet CTDisplayView *ctDisplayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTFrameParserConfig *config = [CTFrameParserConfig new];
    config.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
