//
//  AsteroidView.h
//  Asteroids
//
//  Created by Annie Hua on 2014-01-26.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Sprite.h"



@interface AsteroidView : UIView
{
    Sprite *test;
    Sprite *bz1;
    Sprite *bz2;
    Sprite *bz3;
    Sprite *bz4;
    Sprite *bz5;
    NSTimer *timer;
    int frame;
    int direction;
    int bzcont;
}
 

@end
