//
//  MatrixView.m
//  Matrix
//
//  Created by Andy.Lee on 16/8/31.
//  Copyright © 2016年 Andy.Lee. All rights reserved.
//

#import "MatrixView.h"

@implementation MatrixView

static const int width = 128;
static const int height = 72;
static const int flips = 5;
static const NSString *garbage = @"1234567890!@#$%^&*()ZXCVBNM<>?";

int switches[width];
int count = 0;

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        for (int i = 0; i < width; i++)
        {
            switches[i] = 1;
        }
        
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    for (int i = 0; i < flips; i++)
    {
        int x = arc4random_uniform(width - 1);
        if (switches[x] == 0)
        {
            switches[x] = 1;
        }
        else {
            switches[x] = 0;
        }
    }
    
    for (int i = 0; i < width; i++)
    {
        NSPoint p = NSMakePoint(i * 15 + 10, count * 15 + 10);

        if (switches[i] == 1)
        {
            int x = arc4random_uniform(garbage.length - 1);
            NSString *s = [garbage substringWithRange:NSMakeRange(x, x + 1)];
            [s drawAtPoint:p withAttributes:NULL];
        }
        else {
            NSString *s = @" ";
            [s drawAtPoint:p withAttributes:NULL];
        }
    }
    
    count += 1;
    
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
