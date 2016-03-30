//
//  ViewController.m
//  XPrintFPS
//
//  Created by xlx on 16/3/31.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "ViewController.h"
#import "XPrintFPS.h"
@interface ViewController ()

@property (nonatomic, strong) XPrintFPS *printFPS;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _printFPS = [[XPrintFPS alloc]init];
    [_printFPS startPrint];
    /**
     *  an other methon to use XPrintFPS
     *
     */
    //    [XPrintFPS printFrames];
    
    
    /**
     *  return Current FPS
     *
     */
    __weak ViewController *wself = self;
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"++++++++++++++++++FPS:%@+++++++++++++++++++",[wself.printFPS returnCurrentFPS]);
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
