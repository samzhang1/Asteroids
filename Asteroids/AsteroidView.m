//
//  AsteroidView.m
//  Asteroids
//
//  Created by Annie Hua on 2014-01-26.
//  Copyright (c) 2014 sam. All rights reserved.
//


#import "AsteroidView.h"
#import "VectorSprite.h"
#import "Animasprite.h"
#import "Sprite.h"
#import "ViewController.h"
#import "textsprite.h"
#import "ViewController.h"

@implementation AsteroidView





#define n 10

@synthesize mark;
@synthesize marks;

float theInterval = 0.05;

float ang = 0;
int i;
static int leaf[] = {0,1,2,3,4,5,6,7,8,9};


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
      UITouch *touch = [[event allTouches] anyObject];
      touchx = [touch locationInView: touch.view].x;
      touchy = [touch locationInView: touch.view].y;
    if (touchx == otouchx && touchy == otouchy)
    {
        touchflag = NO;
    }
    else
    {
      touchflag = YES;
      otouchx = touchx;
      otouchy = touchy;
    }
}



-(id) initWithCoder:(NSCoder *) coder
{
    
    
    
    
       if (self = [super initWithCoder: coder])
    {
        leaf = [Animasprite fromFile: @"leaf.png" withRows:1 withColume:10];
        
        for (i=0; i<n; i++)
        {
        ants[i] = [Animasprite fromFile: @"ant.PNG" withRows:1 withColume:4];
        antl[i] = [Animasprite fromFile: @"antl.PNG" withRows:1 withColume:4];
        antdie2[i] = [Animasprite fromFile: @"antdie.PNG" withRows:1 withColume:4];
            
        ants[i].x = random() % 640 - 320;
        ants[i].y = random() % 960 - 480;
            
            ants[i].scale = 1.5;
            antdie2[i].scale = 1.5;
            antl[i].scale = 1.5;
        }

        timer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(gameLoop:) userInfo:nil repeats:YES];
    }
    
    return self;
    
}

- (void) gameLoop: (NSTimer *) Thetimer
{
    
    if (touchflag)
    {
        for (i=0; i<n ; i++)
      {
         
          if ((abs(touchx*2 - 320 - ants[i].x) < ants[i].w ) && (abs(480 - touchy*2 - ants[i].y) < ants[i].h) && touchflag && !ants[i].die)
         {
            ants[i].die = YES;
            diecount ++;
            antmark += 10;
            
            ants[i].diek = 0;
            i = n;
            touchflag = NO;
         }
          
      }
    
   }
            mark.text = [NSString stringWithFormat:@"%3d",antmark];
            marks.text = [NSString stringWithFormat:@"%3d",level];
    
       if (diecount >= n)
    
        {
                 
            for (i = 0; i < n; i++)
             {
               ants[i].die = NO;
               
               ants[i].diek = 1;
               diecount ++;
              }
            
            diecount = 0;
           
            level= (level + 1) % 100;
            ants[i].speed = ants[i].speed + level *200;
        }
    
    for (i=0; i<n ; i++)
        
    {
         if (abs(ants[i].x - leaf.x)< leaf.halfw * 2 && abs(ants[i].y - leaf.y) < leaf.halfh * 2 && !ants[i].die && !ants[i].leaf)
        {
    
            ants[i].leaf = YES;
            
            if (mapleframe == 9)
            {
                level = level-1;
                if (level <0) {level= 0;}
                 ants[i].speed = ants[i].speed + level *200;
            }
            mapleframe = (mapleframe +1) % 10 ;
            leaf.frame =  mapleframe ;
             
        }
        
             ants[i].frame = (ants[i].frame+1) % 4;
        [ants[i] tic: theInterval];
        [self setNeedsDisplay];
    }
}


-(void)drawRect:(CGRect)rect
{
    
        leaf.x = 0;
        leaf.y = 0;
        leaf.scale = 2;
        leaf.alpha = 2;
    
    
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGAffineTransform t0 = CGContextGetCTM(context);
        t0 = CGAffineTransformInvert(t0);
        CGContextConcatCTM(context, t0);
    
       [leaf draw: context];
    
       CGContextRestoreGState(context);
    
     for (i=0; i<n ; i++)
        
     {
         
         
        if (!ants[i].die && !ants[i].leaf)
        {
         
         [ants[i] draw: context];
    
           }
         if (!ants[i].die && ants[i].leaf)
         {
             antl[i].x =ants[i].x;
             antl[i].y = ants[i].y;
             antl[i].frame = ants[i].frame;
             antl[i].rotation = ants[i].rotation;
            
             [antl[i] draw: context];
             
         }
         
         if (ants[i].die)
          {
           antdie2[i].x = ants[i].x;
         antdie2[i].y = ants[i].y;
              antdie2[i].frame = ants[i].frame;
              antdie2[i].rotation = ants[i].rotation;
        
         [antdie2[i] draw: context];
                 
        }
         
          CGContextRestoreGState(context);
     }
   
    //[leaf draw: context];
   
}

/*
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField
{
    
    if (theTextField == self.marks)
    {
        [theTextField resignFirstResponder];
    }
    return YES;
}
*/

-(void) dealloc
{
    [timer invalidate];
    
}
@end
