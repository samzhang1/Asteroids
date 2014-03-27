//
//  AtlasSprite.h
//  Asteroids
//
//  Created by Annie Hua on 2014-02-05.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface Animasprite : Sprite
{
    CGFloat halfw;
    CGFloat halfh;
    CGFloat animaWidth;
    CGFloat animaHeight;
    UIImage *anima;
    CGImageRef image;
    CGRect clipRect;
    int rows;
    int columns;
}
@property (assign) CGFloat halfw, halfh, animaWidth, animaHeight;
@property (assign) CGRect clipRect;
@property (assign) int rows, columns;
@property (retain, nonatomic) UIImage *anima;
@property (assign) CGImageRef image;
+ (Animasprite *) fromFile: (NSString *) fname withRows: (int) rows withColume: (int) columns;
+ (NSMutableDictionary *) sharedspriteanima;
+ (UIImage *) getSpriteanima: (NSString *)name;

@end
