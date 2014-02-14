//
//  bomb.h
//  Asteroids
//
//  Created by Annie Hua on 2014-02-10.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "Sprite.h"
#import "AsteroidView.h"


@interface bomb : UIView
{
    Sprite *bz1;
    Sprite *bz2;
    NSTimer *bztimer;
    int bzframe;
}

@end
