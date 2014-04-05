//
//  sprite.m
//  Asteroids
//
//  Created by Annie Hua on 2014-01-27.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "Sprite.h"



@implementation Sprite
@synthesize x, y, speed, diek, width, height, scale, frame, rotation,flag;
@synthesize r, g, b, alpha, die,w,h,left, leaf;


#define kScreenWidth 640
#define kScreenHeight 960
float sinThet;
float cosThet;


- (void) updateBox
{
     w = width * scale;
     h = height * scale;
     w2 = w * 0.5;
     h2 = h * 0.5;
   // origin = box.origin;
  
     left = - kScreenWidth * 0.6;
    right = - left;
     top = kScreenHeight * 0.6;
     bottem = -top;
  
}

- (void) tic: (NSTimeInterval) dt
{
    if ((x + w2) < left && cosTheta < 0) {cosTheta = -cosTheta; flag = YES;}
    else if ((x -w2) > right && cosTheta > 0) {cosTheta = -cosTheta;flag = YES;}
    else if ((y + h2) < bottem && sinTheta < 0) {sinTheta = -sinTheta; flag = YES;}
    else if ((y - h2) > top && sinTheta > 0) { sinTheta = -sinTheta; flag = YES;}
     if (sinTheta>0 && cosTheta>0) {dir = 0;}
    if (sinTheta>0 && cosTheta<0) {dir = 1;}
    if (sinTheta<0 && cosTheta<0) {dir = 2;}
    if (sinTheta<0 && cosTheta>0) {dir = 3;}
   
    float anga = (random() % 628)/100;
    sinThet = sin(anga)/8*diek + sinTheta;
    cosThet = cos(anga)/8*diek + cosTheta;
    
    
    
    
    
    switch (dir)
    {
            float k = (random() % 100)/1000;
        case 1:
            rotation = sinThet/cosThet + 1.5  ; break;
        case 2:
            rotation = sinThet/cosThet + 1.5  ; break;
        case 3:
            rotation = sinThet/cosThet + 4.5  ; break;
        default:
            rotation = sinThet/cosThet + 4.5  ;
            break;
    }
    if (flag)
    {
        
        self.leaf = NO;
      //  int n;
      //  n = (random() % 100) / 10;
        //sink = n * sinTheta / 0.5;
       // sink = y/x *sinTheta/0.5;
       // cosk = n * cosTheta / 0.7;
       // cosk = y/x* cosTheta/0.5;
        speedk = random() % 200;
        
    }
    flag = NO;
    dt = 0.05;
    
     sdt = (speed+speedk+100) * dt;
    x += (sdt * cosThet + cosk) * diek ;
    y += (sdt * sinThet + sink) * diek ;
    
    //x =200 ;
   // y =200 ;
    
    if (sdt) {[self updateBox];}
}


-(void)drawBody: (CGContextRef) context
{

}
 
-(void)draw: (CGContextRef) context
{
    
    CGContextSaveGState(context);
    CGAffineTransform t = CGAffineTransformIdentity;
   
    t = CGAffineTransformTranslate(t, x + 320 , y + 480 );
  
    t = CGAffineTransformRotate(t, rotation);
    t = CGAffineTransformScale(t, scale, scale);
   
    CGContextConcatCTM(context, t);
    CGContextSetAlpha(context, alpha);
   
   
    [self drawBody:context];

  
}

-(id) init
{
    self = [super init];
    if (self)
    {
        
       // wrap = YES;
       // x = y = 0;
        width = height = 1.0;
        scale = 0.5;
        speed = 200;
        diek = 1;
        rotation = 0;
        cosTheta = 0.7;
        sinTheta = 0.5;
        r = 1.0;
        g = 1.0;
        b = 1.0;
        alpha = 0;
       
      //  box = CGRectMake(0, 0, 0, 0);
        frame = 0;
        flag = YES;
        
    }
    return self;
}
@end
