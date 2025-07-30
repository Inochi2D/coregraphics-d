/**
    CGColor

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgcolor;
import coregraphics.cggeometry;
import coregraphics.cgpattern;

import corefoundation.cfstring;
import corefoundation.cfdictionary;
import corefoundation.cfdata;
import corefoundation;

public import coregraphics.cgcolorspace;
public import coregraphics.cgcolorconversioninfo;

extern(C) @nogc nothrow:

/**
    A set of components that define a color, 
    with a color space specifying how to interpret them.
*/
alias CGColorRef = CFSubType!("CGColor");

/**
    Gets the type identifier for CGColor

    Returns:
        The Type ID of CGColor
*/
extern CFTypeID CGColorGetTypeID();

/**
    Increments the retain count of a color.

    Params:
        color = The color object.
    
    Returns:
        The color object.
*/
extern CGColorRef CGColorRetain(CGColorRef color);

/**
    Decrements the retain count of a color.

    Params:
        color = The color object.
*/
extern void CGColorRelease(CGColorRef color);

/**
    Creates a color using a list of intensity values (including alpha) 
    and an associated color space.

    Params:
        space = The colorspace to create the color in.
        components = The color components of the color.
    
    Returns:
        A new color object on success,
        $(D null) on failure.
*/
extern CGColorRef CGColorCreate(CGColorSpaceRef space, const(CGFloat)* components);

/**
    Returns a color object that represents a constant color.

    Params:
        colorName = The name of the color.
    
    Returns:
        A new color object on success,
        $(D null) on failure.
*/
extern CGColorRef CGColorGetConstantColor(CFStringRef colorName);

/**
    Creates a copy of an existing color.
*/
extern CGColorRef CGColorCreateCopy(CGColorRef color);

/**
    Creates a color in the Generic gray color space.
*/
extern CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha);

/**
    Creates a color in the Generic RGB color space.
*/
extern CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
    Creates a color in the sRGB color space.
*/
extern CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
    Creates a color in the Generic CMYK color space.
*/
extern CGColorRef CGColorCreateGenericCMYK(CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha);

/**
    Creates a copy of an existing color, substituting a new alpha value.
*/
extern CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha);

/**
    Creates a color using a list of intensity values (including alpha), a pattern color space, and a pattern.
*/
extern CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const(CGFloat)* components);

/**
    Creates a new color in a different color space that matches the provided color.
*/
extern CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef space, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options);

/**
    Indicates whether two colors are equal.
*/
extern bool CGColorEqualToColor(CGColorRef color1, CGColorRef color2);

/**
    Returns the value of the alpha component associated with a color.
*/
extern CGFloat CGColorGetAlpha(CGColorRef color);

/**
    Returns the color space associated with a color.
*/
extern CGColorSpaceRef CGColorGetColorSpace(CGColorRef color);

/**
    Returns the values of the color components (including alpha) associated with a color.
*/
extern const(CGFloat)* CGColorGetComponents(CGColorRef color);

/**
    Returns the number of color components (including alpha) associated with a color.
*/
extern size_t CGColorGetNumberOfComponents(CGColorRef color);

/**
    Returns the pattern associated with a color in a pattern color space.
*/
extern CGPatternRef CGColorGetPattern(CGColorRef color);