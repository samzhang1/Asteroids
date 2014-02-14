//
//  AtlasSprite.m
//  Asteroids
//
//  Created by Annie Hua on 2014-02-05.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "AtlasSprite.h"

@implementation AtlasSprite
@synthesize rows, columns;
@synthesize image, atlas, atlasWidth, atlasHeight, clipRect, w2, h2;

+(NSMutableDictionary *) sharedspriteAtlas
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

+ (UIImage *) getSpriteAtlas:(NSString *) name
{
    NSMutableDictionary *d = [AtlasSprite sharedspriteAtlas];
    UIImage *img = [d objectForKey: name];
    if (!img)
    {
        img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType: Nil]];
        [d setObject: img forKey:name];
    }
    return img;
    
}

+ (AtlasSprite *) fromFile:(NSString *)fname withRows:(int)rows withColume:(int)columns
{
    AtlasSprite *s = [[AtlasSprite alloc] init];
    s.atlas = [AtlasSprite getSpriteAtlas:fname];
    CGImageRef img = [s.atlas CGImage];
    s.image = img;
    
    int width = CGImageGetWidth(s.image);
    int height = CGImageGetHeight(s.image);
    if (rows < 1) {rows = 1;}
    if (columns <1) {columns = 1;}
    s.atlasWidth = width;
    s.atlasHeight = height;
    s.rows = rows;
    s.columns = columns;
    s.width = round(width/ s.columns);
    s.height = round(height/ s.rows);
    s.w2 = s.width * 0.5;
    s.h2 = s.height * 0.5;
    s.clipRect = CGRectMake(-s.width * 0.5, -s.height * 0.5, s.width, s.height);
    return s;
    
}

- (void) drawBody: (CGContextRef) context;
{
    int r0 = floor(frame / columns);
    int c0 = frame - columns * r0;
    CGFloat u = c0 * width + w2;
    CGFloat v = atlasHeight - (r0 * height + h2);
    CGContextBeginPath(context);
    CGContextAddRect(context, clipRect);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(-u, -v, atlasWidth, atlasHeight), image);
}

- (id) init
{
    self = [super init];
    if (self) { rows = 0;}
    return self;
}


@end
