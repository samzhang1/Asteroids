//
//  AsteroidView.h
//  Asteroids
//
//  Created by Annie Hua on 2014-01-26.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Sprite.h"
#include "Animasprite.h"


@interface AsteroidView : UIView
{
    Sprite *ants[10];
   // Sprite *maple;
    Sprite *antdie2[10];
    Sprite *antl[10];
    Animasprite *leaf;
    
    NSTimer *timer;
    int frame;
    int direction;
    CGFloat touchx;
    CGFloat touchy;
    bool touchflag;
    int diecount;
    int antmark;
    UILabel * mark;
    UITextField * marks;
    CGFloat otouchx;
    CGFloat otouchy;
    int  mapleframe;
    int level;
    
}
@property (retain, nonatomic) IBOutlet UILabel *mark;
@property (retain, nonatomic) IBOutlet UITextField *marks;
//@property (assign) int mapleframe, frame;

@end
