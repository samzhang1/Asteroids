//
//  textsprite.m
//  Asteroids
//
//  Created by Annie Hua on 2014-02-13.
//  Copyright (c) 2014 sam. All rights reserved.
//

#import "textsprite.h"
//#import "Sprite.h"
#define kDefaultFont @"Helvetica"
#define kDefaultfontSize 14



@implementation TextSprite


@synthesize  fontSize;
//@synthesize text, font;

- (id) init
{
 
    self = [super init];
    if (self)
    {
        fontSize = kDefaultfontSize;
      text = nil;
        width = height = 0;
        
    }
    return self;
}


 + (TextSprite *) withString:(NSString *)label
{
    TextSprite *ts = [[TextSprite alloc] init];
    ts.text = label;
    return ts;
    
}



- (void) newText:(NSString *)val
{
    width = 0;
    height = 0;
}





- (void) computeWidth: (CGContextRef) context
{

    textLength = [text length];
    CGFontRef fref = CGFontCreateWithFontName((CFStringRef) font);
    if (!fref)
    {
        width = 0;
        height = 0;
        printf("waring: missing font %s\n", [font UTF8String]);
        return;
    }
    CGRect bbox = CGFontGetFontBBox(fref);
    int units = CGFontGetUnitsPerEm(fref);
    height = (((float) bbox.size.height)/((float)units)) * fontSize;
    CGPoint left = CGContextGetTextPosition(context);
    CGContextSetTextDrawingMode(context, kCGTextInvisible);
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    void CGContextSelectFont (
                              CGContextRef context,
                              const char  *font,
                              CGFloat fontSize,
                              CGTextEncoding kCGEncodingMacRoman
                              );
    void CGContextShowText (
                            CGContextRef context,
                            const char *font,
                            size_t textLength
                            );
    
    CGPoint right = CGContextGetTextPosition(context);
    width = right.x - left.x;
    
    [self updateBox];
    CGFontRelease(fref);
    
    return;
    
}

-(void) drawBody: (CGContextRef) context
{
 
    
    if (!text) {return;}
    if (!width) {[self computeWidth: context];}
   
    CGContextSetTextDrawingMode(context, kCGTextFillStroke);
    CGContextSetRGBFillColor(context, r, g, b, alpha);
    CGContextSetRGBStrokeColor(context, r, g, b, alpha);
    void CGContextShowTextAtPoint (CGContextRef context, float x, float y, const char *font, size_t textLength);
 
}

- (void) moveUpperLeftTo:(CGPoint) p
{
   
    CGPoint p2 = CGPointMake(0, 0);
    p2.x = p.x;
    p2.y = p.y + height;
    CGContextRef context = UIGraphicsGetCurrentContext();
     [self drawBody:context];
    
}



@end
