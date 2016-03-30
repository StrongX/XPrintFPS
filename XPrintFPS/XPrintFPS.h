//
//  XPrintFPS.h
//  XPrintFPS
//
//  Created by xlx on 16/3/31.
//  Copyright © 2016年 xlx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface XPrintFPS : NSObject
/**
 *  declare displayLink
 *
 */
@property (nonatomic, strong) CADisplayLink  *displayLink;

/**
 *  output current Frames Per Second
 */
+(void)printFrames;
/**
 *  start output FPS
 */
-(void)startPrint;
/**
 *  stop output FPS
 */
-(void)stopPrint;
/**
 *  return FPS
    you can not use this methon synchronize with [[XPrintFPS alloc]init]
 */
-(NSString *)returnCurrentFPS;
@end
