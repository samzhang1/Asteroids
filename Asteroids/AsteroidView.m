//
//  AsteroidView.m
//  Asteroids
//
//  Created by Annie Hua on 2014-01-26.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "AsteroidView.h"
#import "VectorSprite.h"
#import "AtlasSprite.h"
#import "Sprite.h"
#import "ViewController.h"

@implementation AsteroidView

//#define kVectorArtCount 12
//static CGFloat kVectorArt[] = {-7,12, 1,9, 8,12, 15,5, 8,3, 15,-4, 8,-12,
//    -3,-10, -6,-12, -14,-7, -10,0, -14,5};
#define RANDOM_SEED() srandom(time (NULL))
#define RANDOM_INT(__MIN__, __MAX__) ((__MIN__) + random() % ((__MAX__+1) - (__MIN__)))
#define kSteps 8
#define kSpeed 2000
#define kFPS 20
#define kBounce 10
#define kDirForward 0
#define kDirBackward 3
#define kDirUp 1
#define kDirDown 2
static int kForward[] = {0,1,2,3,4,5,6,7};
static int kUpward[] = {8,9,10,11,12,13,14,15};
static int kDownward[] = {16,17,18,19,20,21,22,23};
static int kBackward[] = {24,25,26,27,28,29,30,31};
float theInterval = 0.1;

static int z1[] = {0,1,2,3,4};
static int z2[] = {0,1,2,3,4};
static int z3[] = {0,1,2,3,4,5,6,7,8,9,10,11};
static int z4[] = {0,1,2,3,4,5,6,7,8,9,10};
static int z5[] = {0,1,2,3,4,5,6,7,8,9,10};





-(id) initWithCoder:(NSCoder *) coder
{
   
    if (self = [super initWithCoder: coder])
    {
        test = [AtlasSprite fromFile: @"mario.PNG" withRows:4 withColume:8];
      //  bz1 = [AtlasSprite fromFile: @"z1.PNG" withRows:1 withColume:5];
      //  bz2 = [AtlasSprite fromFile: @"z2.PNG" withRows:1 withColume:5];
        bz3 = [AtlasSprite fromFile: @"z3.PNG" withRows:1 withColume:12];
        //bz4 = [AtlasSprite fromFile: @"z4.PNG" withRows:1 withColume:11];
      //  bz5 = [AtlasSprite fromFile: @"z5.PNG" withRows:1 withColume:11];
        
        
        test.angle = 0;
        
        direction = kDirForward;
        self.backgroundColor = [UIColor whiteColor];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(gameLoop:) userInfo:nil repeats:YES];
        
    }
    return self;
    
}

- (void) gameLoop: (NSTimer *) Thetimer
{
    
  /*  bz1.x = test.x ;
    bz1.y = test.y ;
    bz1.alpha = 1;
    bz1.scale = test.scale;
    
    bz2.x = test.x ;
    bz2.y = test.y ;
    bz2.alpha = 1;
    bz2.scale = test.scale;
   */
    bz3.x = test.x ;
    bz3.y = test.y ;
    bz3.alpha = 1;
    bz3.scale = test.scale;
   /*
    bz4.x = test.x ;
    bz4.y = test.y ;
    bz4.alpha = 1;
    bz4.scale = test.scale;
   
    bz5.x = test.x;
    bz5.y = test.y;
    bz5.alpha = 1;
    bz5.scale = test.scale;
    */
    
    
    frame = (frame + 1) % kSteps;
    [test tic: theInterval];
    
 
    
//if (test.offScreen)
//  {
        RANDOM_SEED();
        int toCenter = round(atan2(-test.y, -test.x) *180/3.141592);
        if (toCenter < 0){ toCenter += 360;}
        int bounce = (toCenter + RANDOM_INT(-kBounce, kBounce)) % 360;
        if (bounce <= 60 || bounce >= 300) { direction = kDirForward; }
        else if (bounce >60 && bounce < 120){direction = kDirUp;}
        else if (bounce >= 120 && bounce <= 240){direction = kDirBackward;}
        else direction = kDirDown;
        test .angle = bounce;
        test.scale = 1 +4*RANDOM_INT(0,10)/ 10;
    test.scale = 3;
        while (test.offScreen) {[test tic: 1/kFPS]; }
 // }
    
    
    
    test.scale = 2 - test.y / 200;
    switch (direction)
    {
        case kDirForward: test.frame = kForward [frame]; break;
        case kDirBackward: test.frame = kBackward [frame]; break;
        case kDirUp: test.frame = kUpward [frame]; break;
        case kDirDown: test.frame = kDownward [frame]; break;
    }
    [self setNeedsDisplay];
   
}


-(void)drawRect:(CGRect)rect
{
    
    if (test.flag && bzcont <= 12)
        
    {
        test.speed = 0;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGAffineTransform t0 = CGContextGetCTM(context);
        t0 = CGAffineTransformInvert(t0);
        CGContextConcatCTM(context, t0);
        bz3.frame =  z3[bzcont];
        [bz3 draw:context];
        CGContextRestoreGState(context);
        bzcont = bzcont +1;
    }
    else
    {
        test.speed = kSpeed;
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGAffineTransform t0 = CGContextGetCTM(context);
        t0 = CGAffineTransformInvert(t0);
        CGContextConcatCTM(context, t0);
        
        [test draw: context];
        CGContextRestoreGState(context);
        test.flag = NO;
        bzcont = 0;
    }
}




-(void) dealloc
{
    [timer invalidate];
    
}
@end
