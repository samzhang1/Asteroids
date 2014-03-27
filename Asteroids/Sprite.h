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
   // CGRect box;
    CGFloat x;
    CGFloat y;
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat alpha;
    CGFloat speed;
    CGFloat diek;
    CGFloat rotation;
    CGFloat width;
    CGFloat height;
    CGFloat scale;
    CGFloat left;
    CGFloat top;
    CGFloat cosTheta;
    CGFloat w;
    CGFloat h;
    CGFloat w2;
    CGFloat h2, sink, cosk, speedk;
    CGFloat right;
    CGFloat bottem, sdt;
   // CGPoint origin;
   // CGSize  bsize;
    int dir;
    BOOL die;
    BOOL leaf;
    
    
    
    
    int frame;
    
    CGFloat sinTheta;
    
    
   // BOOL render;
   // BOOL offScreen;
   // BOOL wrap;
    BOOL flag;
   // NSString *stext;

}

//@property (assign) CGRect box;
@property (assign) BOOL flag;
@property (assign) CGFloat x, y, r, g, b, alpha,w,h;
@property (assign) CGFloat speed, diek, rotation;
@property (assign) CGFloat width, height, scale,left;
@property (assign) BOOL die, leaf;
@property (assign) int frame;


- (void) tic: (NSTimeInterval) dt;
-(void)draw: (CGContextRef) context;

- (void) updateBox;
@end
