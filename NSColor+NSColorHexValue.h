//
//  NSColor+NSColorHexValue.h
//  ScoreBoard-TV
//
//  Created by Frank Fuchs on 26/03/15.
//  Copyright (c) 2015 BrainSellers. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (NSColorHexValue)

+ (NSColor*)colorWithHexColorString:(NSString*)hexString;
-(NSString *)hexColor;

@end
