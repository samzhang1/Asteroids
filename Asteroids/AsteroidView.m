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
#import "ViewController.h"



@implementation AsteroidView





#define n 10

@synthesize mark;
@synthesize marks;

float theInterval = 0.01;

float ang = 0;
int i;
float  timecon;
float  timeconk;
int  dismark =0;

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
    timecon = 0;

    so = [audiosprite alloc];
    //[so initaudio ];
   
       if (self = [super initWithCoder: coder])
    {
       
     NSArray *song[] = {@"song0",@"song1",@"song2",@"song3",@"song4",@"song5",@"song6",
       @"song7",@"song8",@"song9",@"song10",@"song11"};
 
        
        
        int i;
        for (i=0; i<10; i++)
        {
        surl[i] = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:
                 song[i] ofType: @"wav"]];
            
           AudioServicesCreateSystemSoundID((__bridge CFURLRef)surl[i], &(sid[i]));
        }
        
        leaf = [Animasprite fromFile: @"leaf.png" withRows:1 withColume:10];
        backpic = [Animasprite fromFile:@"glass.PNG" withRows:1 withColume:4];
    
        
        for (i=0; i<n; i++)
        {
        ants[i] = [Animasprite fromFile: @"ant.PNG" withRows:1 withColume:4];
        antl[i] = [Animasprite fromFile: @"antl.PNG" withRows:1 withColume:4];
        antdie2[i] = [Animasprite fromFile: @"antdie.PNG" withRows:1 withColume:4];
            
        ants[i].x = random() % 640 - 320;
        ants[i].y = random() % 960 - 480;
            
            ants[i].scale = 1;
            antdie2[i].scale = 1;
            antl[i].scale = 1;
        }

        timer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(gameLoop:) userInfo:nil repeats:YES];
    }
    
    return self;
   
    
}

- (void) gameLoop: (NSTimer *) Thetimer
{
    if (timecon== 0) {timeconk = 1;}
    if (timecon ==20) { timeconk = -1;}
    timecon = (timecon + timeconk);
    
    if (touchflag)
    {
        for (i=0; i<n ; i++)
      {
         
          if ((abs(touchx*2 - 320 - ants[i].x) < ants[i].w ) && (abs(480 - touchy*2 - ants[i].y) < ants[i].h) && touchflag && !ants[i].die )
         {
             antdie2[i].x = ants[i].x;
             antdie2[i].y = ants[i].y;
             ants[i].die = YES;
             antdie2[i].frame = 0;
             antdie2[i].scale = 6;
             antdie2[i].alpha = 1;
             antdie2[i].rotation = ants[i].rotation;
            diecount ++;
            antmark += 10;
            
            ants[i].diek = 0;
             //int j = random() % 15;
             
            AudioServicesPlaySystemSound(sid[i]);
           
             
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
               
              }
            
            diecount = 0;
            
            
           
            level= (level + 1) % 100;
      
        }
    
    for (i=0; i<n ; i++)
        
    {
          ants[i].speed = level *200;
        
         if (abs(ants[i].x - leaf.x)< leaf.halfw * 2 && abs(ants[i].y - leaf.y) < leaf.halfh * 2 && !ants[i].die && !ants[i].leaf)
        {
    
            ants[i].leaf = YES;
            
            if (mapleframe == 9)
            {
                level = level-1;
                if (level <0) {level= 0;}
                 
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
    
     CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGAffineTransform t0 = CGContextGetCTM(context);
    t0 = CGAffineTransformInvert(t0);
    CGContextConcatCTM(context, t0);
    
 //   if (dismark < 100)
 //   {
 //   dismark++;
    
    backpic.frame = level;
        backpic.alpha = 1;
        backpic.scale = 13;
        backpic.x = 0;
        backpic.y =100;
    
   
     [backpic draw: context];
     CGContextRestoreGState(context);
    
  // }
        leaf.x = 0;
        leaf.y = 0;
        leaf.scale = 2;
        leaf.alpha = 1;
    
    
        [leaf draw: context];
    
       CGContextRestoreGState(context);
    
     for (i=0; i<n ; i++)
        
     {
         
         
        if (!ants[i].die && !ants[i].leaf)
        {
            ants[i].alpha = 1 ;
            
         [ants[i] draw: context];
    
           }
         if (!ants[i].die && ants[i].leaf)
         {
             antl[i].x =ants[i].x;
             antl[i].y = ants[i].y;
             antl[i].frame = ants[i].frame;
             antl[i].rotation = ants[i].rotation;
             antl[i].alpha = 1 ;
             
             [antl[i] draw: context];
             
         }
         
         if (ants[i].die)
          {
          
              antdie2[i].scale = antdie2[i].scale + 0.5;
              if (antdie2[i].scale>2) {antdie2[i].scale = 2;}
                  
              
              
              antdie2[i].alpha = antdie2[i].alpha - 0.2;
              if (antdie2[i].alpha <0 ) {antdie2[i].alpha = 0;}
              antdie2[i].frame = antdie2[i].frame +1;
              if (antdie2[i].frame>4)
              {
                  antdie2[i].die=0;
                //  antdie2[i].scale = 1;
                  antdie2[i].y = 0;
              }
        
         [antdie2[i] draw: context];
                 
        }
         
          CGContextRestoreGState(context);
     }
   
  
   
}



-(void) dealloc
{
   [timer invalidate];
    
}
@end
