//
//  sprite.h
//  Asteroids
//
//  Created by Annie Hua on 2014-01-27.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Sprite : NSObject
{
    CGRect box;
    CGFloat x;
    CGFloat y;
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat alpha;
    CGFloat speed;
    CGFloat angle;
    CGFloat rotation;
    CGFloat width;
    CGFloat height;
    CGFloat scale;
    CGFloat left;
    CGFloat top;
    CGFloat cosTheta;
    int frame;
    
    CGFloat sinTheta;
    
    
    BOOL render;
    BOOL offScreen;
    BOOL wrap;
    BOOL flag;

}

@property (assign) CGRect box;
@property (assign) BOOL wrap, render, offScreen, flag;
@property (assign) CGFloat x, y, r, g, b, alpha;
@property (assign) CGFloat speed, angle, rotation;
@property (assign) CGFloat width, height, scale;

@property (assign) int frame;

- (void) tic: (NSTimeInterval) dt;
-(void)draw: (CGContextRef) context;

@end
