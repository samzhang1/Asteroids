//
//  AtlasSprite.m
//  Asteroids
//
//  Created by Annie Hua on 2014-02-05.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "Animasprite.h"

@implementation Animasprite



@synthesize rows, columns;
@synthesize image, anima, animaWidth, animaHeight, clipRect, halfw, halfh;

+(NSMutableDictionary *) sharedspriteanima
{
    static NSMutableDictionary *sharedSpriteDictionary;
    @synchronized(self)
    {
        if (!sharedSpriteDictionary)
        {
            sharedSpriteDictionary = [[NSMutableDictionary alloc] init];
            return sharedSpriteDictionary;
        }
    }
    return sharedSpriteDictionary;
}

+ (UIImage *) getSpriteanima:(NSString *)name
{
    NSMutableDictionary *d = [Animasprite sharedspriteanima];
    UIImage *img = [d objectForKey: name];
    if (!img)
    {
        img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType: Nil]];
        [d setObject: img forKey:name];
    }
    return img;
    
}

+ (Animasprite *) fromFile:(NSString *)fname withRows:(int)rows withColume:(int)columns
{
    Animasprite *s = [[Animasprite alloc] init];
    s.anima = [Animasprite getSpriteanima:fname];
    CGImageRef img = [s.anima CGImage];
    s.image = img;
    
    int width = CGImageGetWidth(s.image);
    int height = CGImageGetHeight(s.image);
    if (rows < 1) {rows = 1;}
    if (columns <1) {columns = 1;}
    s.animaWidth = width;
    s.animaHeight = height;
    s.rows = rows;
    s.columns = columns;
    s.width = round(width/ s.columns);
    s.height = round(height/ s.rows);
    s.halfw = s.width * 0.5;
    s.halfh = s.height * 0.5;
    s.clipRect = CGRectMake(-s.halfw, -s.halfh, s.width, s.height);
    return s;
    
}

- (void) drawBody: (CGContextRef) context;
{
   
    int r0 = floor(frame / columns);
    int c0 = frame - columns * r0;
    CGFloat u = c0 * width + halfw;
    CGFloat v = animaHeight - (r0 * height + halfh);
    CGContextBeginPath(context);
    CGContextAddRect(context, clipRect);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(-u, -v, animaWidth, animaHeight), image);
    
}

- (id) init
{
    self = [super init];
    if (self) { rows = 0; columns = 0;}
    return self;
}


@end
