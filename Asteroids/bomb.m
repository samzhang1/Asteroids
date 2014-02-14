//
//  bomb.m
//  Asteroids
//
//  Created by Annie Hua on 2014-02-10.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "bomb.h"
#import "Sprite.h"
#import "AtlasSprite.h"
#import "AsteroidView.h"
#import "ViewController.h"

@implementation bomb
#define bombspeed 10;


static int z1[] = {0,1,2,3,4};
static int z2[] = {0,1,2,3,4};
float bombtimer = 0.1;

- (id) initWithCoder: (NSCoder *) coder

{
    if (self = [super initWithCoder:coder])
    {
        bz1 = [AtlasSprite fromFile: @"bz1.png" withRows:1 withColume:5];
        bz2 = [AtlasSprite fromFile: @"bz2.png" withRows:1 withColume:5];
        bz1.speed = bombspeed;
        bz2.speed = bombspeed;
  //    bztimer = [NSTimer scheduledTimerWithTimeInterval: bombtimer target:self selector:bombing userInfo:NO repeats:YES];
    }
    return self;
    
}






@end
