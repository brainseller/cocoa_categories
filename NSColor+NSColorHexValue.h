//
//  NSColor+NSColorHexValue.h
//
//  Created by Frank Fuchs on 26/03/15.
//  http://frankfuchs.net
//

#import <Cocoa/Cocoa.h>

@interface NSColor (NSColorHexValue)

+ (NSColor*)colorWithHexColorString:(NSString*)hexString;
-(NSString *)hexColor;

@end
