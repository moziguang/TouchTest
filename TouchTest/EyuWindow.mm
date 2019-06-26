//
//  EyuWindow.m
//
//
//  Created by ios on 16/8/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "EyuWindow.h"
#import "ViewController.h"

@implementation EyuWindow

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    NSLog(@"%s",__func__);
    int index = -1;
    
    if(point.x<self.frame.size.width/4)
    {
        index = 0;
    }else if(point.x<self.frame.size.width/2)
    {
        index = 1;
    }else if(point.x<self.frame.size.width*3/4)
    {
        index = 2;
    }else{
        index = 3;
    }
    NSLog(@"lwq, hitTest x = %f, y = %f, index = %d", point.x, point.y, index+1);
    UIView *touchView = [super hitTest:point withEvent:event];
//    NSLog(@"lwq, hitTest touch view = %@", touchView);
    return touchView;
}

static UITouch* sTouch[4];

// Pass the touches to the superview
#pragma mark - Touch Delegate
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch* touch:touches)
    {
        int index = -1;
        //    UITouch *touch = [touches anyObject];   //视图中的所有对象
        CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
        
        if(point.x<self.frame.size.width/4)
        {
            index = 0;
        }else if(point.x<self.frame.size.width/2)
        {
            index = 1;
        }else if(point.x<self.frame.size.width*3/4)
        {
            index = 2;
        }else{
            index = 3;
        }
        NSLog(@"lwq, touchesBegan point.x = %f, point.y = %f, index = %d", point.x, point.y, index + 1);
        sTouch[index] = touch;
        
        [ViewController touchesBegan:index];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch* touch:touches)
    {
        int index = -1;
        //    UITouch *touch = [touches anyObject];   //视图中的所有对象
        //    CGPoint point = [touch preciseLocationInView:[touch view]]; //返回触摸点在视图中的当前坐标
        
        if(sTouch[0] == touch)
        {
            index = 0;
        }else if(sTouch[1] == touch)
        {
            index = 1;
        }else if(sTouch[2] == touch)
        {
            index = 2;
        }else if(sTouch[3] == touch){
            index = 3;
        }
        NSLog(@"lwq, touchesEnded index = %d", index + 1);
        [ViewController touchesEnded:index];
    }
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

#pragma mark - UIView - Responder

@end
