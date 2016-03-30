//
//  XPrintFPS.m
//  XPrintFPS
//
//  Created by xlx on 16/3/31.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import "XPrintFPS.h"

@implementation XPrintFPS
{
    CFTimeInterval lastTimestamp;
    NSString *FPS;
    
}
-(void)dealloc{
    [_displayLink setPaused:YES];
    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    NSLog(@"displayLink release");
}
-(id)init{
    self = [super init];
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkTick)];
    [_displayLink setPaused:YES];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    lastTimestamp = CACurrentMediaTime();
    return self;
}
-(void)displayLinkTick{
    CFTimeInterval nowTimestamp = _displayLink.timestamp;
    CFTimeInterval difference = nowTimestamp - lastTimestamp;
    NSLog(@"current FPS:%f",1/difference);
    lastTimestamp = nowTimestamp;
    [_displayLink setPaused:YES];

    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [_displayLink setPaused:NO];
        lastTimestamp = CACurrentMediaTime();
    });
    FPS = [NSString stringWithFormat:@"%f",1/difference];
}
+(void)printFrames{
   XPrintFPS *XOutput = [[XPrintFPS alloc]init];
    [XOutput.displayLink setPaused:NO];
}
-(void)startPrint{
    [_displayLink setPaused:NO];
}
-(void)stopPrint{
    [_displayLink setPaused:YES];
}
-(NSString *)returnCurrentFPS{
    return FPS;
}
@end
