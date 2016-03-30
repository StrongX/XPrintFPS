# XPrintFPS
this is a class to print FPS in iOS

>I have write a class ------XPrintFPS to calculate the FPS in iOS,and you can find it in github:https://github.com/StrongX/XPrintFPS
you can log the FPS in console like this:
```
 _printFPS = [[XPrintFPS alloc]init];
    [_printFPS startPrint];
    /**
     *  an other methon to use XPrintFPS
     *
     */
    //    [XPrintFPS printFrames];
```
you also can get the current FPS by XPrintFPS,you can do like this:
```
        NSString *currentFPS = [wself.printFPS returnCurrentFPS];
```
but you can't use this method to get FPS  synchronize with [[XPrintFPS alloc]init].because ,when XPrintFPS init,it does not get the current FPS,XPrintFPS most run someTime(when the Frame update first return ) to get FPS.

XPrintFPS is easy to use,and you can download the demo in github.
look more in my blog:http://www.StrongX.com
