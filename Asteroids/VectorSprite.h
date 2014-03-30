//
//  VectorSprite.h
//  Asteroids
//
//  Created by Annie Hua on 2014-02-03.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface VectorSprite : Sprite
{
    CGFloat *points;
    int count;
    CGFloat vectorScale;
    
}

@property (assign) int count;
@property (assign) CGFloat vectorScale;
@property (assign) CGFloat *points;

+(VectorSprite *) withPoints: (CGFloat *) rawPoints count: (int) count;
-(void) updateSize;
@end
