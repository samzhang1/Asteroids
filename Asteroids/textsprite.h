//
//  textsprite.h
//  Asteroids
//
//  Created by Annie Hua on 2014-02-13.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface TextSprite : Sprite
{
   
    TextSprite *tstext;
    uint fontSize;
    uint textLength;
    NSString *text;
    NSString *font;
 
}


@property (assign) uint fontSize;

@property (assign) NSString *text;
@property (assign) NSString *font;


+ (TextSprite *) withString: (NSString *) label;
- (void) moveUpperLeftTo: (CGPoint) p;
- (void) newText: (NSString *) val;
- (void) computeWidth: (CGContextRef) context;
@end
