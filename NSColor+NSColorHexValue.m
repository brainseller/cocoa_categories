//
//  NSColor+NSColorHexValue.m
//  ScoreBoard-TV
//
//  Created by Frank Fuchs on 26/03/15.
//  Copyright (c) 2015 BrainSellers. All rights reserved.
//

#import "NSColor+NSColorHexValue.h"

@implementation NSColor (NSColorHexValue)

+ (NSColor*)colorWithHexColorString:(NSString*)hexString
{
    NSColor *result = nil;
    NSString *cleanedHexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    cleanedHexString = [cleanedHexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    // after removing # or 0x, check for length to correct strings like 03f into 0033ff
    if (cleanedHexString.length == 3) {
        NSString *fl = [cleanedHexString substringWithRange:NSMakeRange(0, 1)];
        NSString *sl = [cleanedHexString substringWithRange:NSMakeRange(1, 1)];
        NSString *tl = [cleanedHexString substringWithRange:NSMakeRange(2, 1)];
        cleanedHexString = [NSString stringWithFormat:@"%@%@%@%@%@%@",fl,fl,sl,sl,tl,tl];
    }
    
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    NSScanner* scanner = [NSScanner scannerWithString:cleanedHexString];
    (void) [scanner scanHexInt:&colorCode];
    
    redByte = (unsigned char)(colorCode >> 16);
    greenByte = (unsigned char)(colorCode >> 8);
    blueByte = (unsigned char)(colorCode); // masks off high bits
    
    result = [NSColor
              colorWithCalibratedRed:(CGFloat)redByte / 0xff
              green:(CGFloat)greenByte / 0xff
              blue:(CGFloat)blueByte / 0xff
              alpha:1.0];
    return result;
}

-(NSString *)hexColorWithPrefix:(NSString *)prefix
{
    CGFloat redFloatValue, greenFloatValue, blueFloatValue;
    int redIntValue, greenIntValue, blueIntValue;
    NSString *redHexValue, *greenHexValue, *blueHexValue;
    
    // Convert NSColor to RGB
    NSColor *rgbColor=[self colorUsingColorSpaceName:NSCalibratedRGBColorSpace];
    
    if(rgbColor)
    {
        // Get red, green, blue and drop alpha
        [rgbColor getRed:&redFloatValue green:&greenFloatValue blue:&blueFloatValue alpha:NULL];
        
        // Convert components to numbers
        redIntValue=redFloatValue*255.99999f;
        greenIntValue=greenFloatValue*255.99999f;
        blueIntValue=blueFloatValue*255.99999f;
        
        // Convert  numbers to hex strings
        redHexValue=[NSString stringWithFormat:@"%02x", redIntValue];
        greenHexValue=[NSString stringWithFormat:@"%02x", greenIntValue];
        blueHexValue=[NSString stringWithFormat:@"%02x", blueIntValue];
        
        // Concatenate strings and add prefix
        return [NSString stringWithFormat:@"%@%@%@%@", prefix, redHexValue, greenHexValue, blueHexValue];
    }
    return nil;
}

@end
