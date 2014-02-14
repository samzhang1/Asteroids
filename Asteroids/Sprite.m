//
//  sprite.m
//  Asteroids
//
//  Created by Annie Hua on 2014-01-27.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "Sprite.h"



@implementation Sprite
@synthesize x, y, speed, angle, width, height, scale, frame, box, rotation, wrap, render, flag;
@synthesize r, g, b, alpha, offScreen;

#define kScreenWidth 320
#define kScreenHeight 480



- (void) updateBox
{
    CGFloat w = width * scale;
    CGFloat h = height * scale;
    CGFloat w2 = w * 0.5;
    CGFloat h2 = h * 0.5;
    CGPoint origin = box.origin;
    CGSize  bsize = box.size;
     left = - kScreenWidth * 0.5;
    CGFloat right = - left;
     top = kScreenHeight * 0.5;
    CGFloat bottem = -top;
    
    
    offScreen = NO;
    if (wrap)
    {
        if ((x + w2) < left && cosTheta < 0) {cosTheta = -cosTheta; flag = YES;}
        else if ((x -w2) > right && cosTheta > 0) {cosTheta = -cosTheta;flag = YES;}
        else if ((y + h2) < bottem && sinTheta < 0) {sinTheta = -sinTheta; flag = YES;}
        else if ((y - h2) > top && sinTheta > 0) { sinTheta = -sinTheta; flag = YES;}
    }
/*    else
    {
        offScreen =
        ((x + w2) < left) ||
        ((x - w2) > right) ||
        ((y + h2) < bottem) ||
        ((y - h2) > top);
    }*/
    origin.x = x - w2 * scale;
    origin.y = y - h2 *scale;
    bsize.width = w;
    bsize. height = h;
    box.origin = origin;
    box.size = bsize;
}

- (void) tic: (NSTimeInterval) dt
{
    dt = 0.01;
    if (!render){ return;}
    CGFloat sdt = speed * dt;
    x += sdt * cosTheta;
    y += sdt * sinTheta;
    if (sdt) {[self updateBox];}
}



-(void) outlinePath: (CGContextRef) context
{
    
    CGFloat w2 = box.size.width * 0.5;
    CGFloat h2 = box.size.height * 0.5;
    
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, -w2, -h2);
    CGContextAddLineToPoint(context, -w2, h2);
    CGContextAddLineToPoint(context, w2, h2);
    CGContextAddLineToPoint(context, w2, -h2);
    
    CGContextAddLineToPoint(context, -w2, -h2);
}

-(void)drawBody: (CGContextRef) context
{
    CGContextSetRGBFillColor(context, r, g, b, alpha);
    [self outlinePath: (context)];
    CGContextDrawPath(context, kCGPathEOFill);
}

-(void)draw: (CGContextRef) context
{
    box.size.width = width;
    box.size.height = height;
    
    CGContextSaveGState(context);
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformTranslate(t, x + kScreenWidth , y + kScreenHeight );
    t = CGAffineTransformRotate(t, rotation);
    t = CGAffineTransformScale(t, scale, scale);
    CGContextConcatCTM(context, t);
    
    
    /*  CGContextBeginPath(context);
     CGContextSetRGBFillColor(context, 0, 1, 0, 1);
     CGContextAddRect(context, CGRectMake(0, 0, 100, 200));
     CGContextClosePath(context);
     CGContextDrawPath(context, kCGPathEOFill);
     */
    
    
    [self drawBody:context];
  //  CGContextRestoreGState(context);
}

-(id) init
{
    self = [super init];
    if (self)
    {
        wrap = YES;
        x = y = 0;
        width = height = 1.0;
        scale = 1.0;
        speed = 0.0;
        angle = 0.0;
        rotation = 0;
        cosTheta = 0.7;
        sinTheta = 0.5;
        r = 1.0;
        g = 1.0;
        b = 1.0;
        alpha = 1.0;
        offScreen = NO;
        box = CGRectMake(0, 0, 0, 0);
        frame = 0;
        render =  YES;
    }
    return self;
}
@end
