/**
    CGColorConversionInfo

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgcolorconversioninfo;
import coregraphics.cggeometry;
import coregraphics.cgcolorspace;
import coregraphics.cgimage;

import corefoundation.cfstring;
import corefoundation.cfdictionary;
import corefoundation;

extern (C) @nogc nothrow:

/**
    Format of a color buffer.
*/
struct CGColorBufferFormat {
    uint version_;
    CGBitmapInfo bitmapInfo;
    size_t bitsPerComponent;
    size_t bitsPerPixel;
    size_t bytesPerRow;
}

/**
    Constants describing how a color conversion uses color spaces.
*/
enum CGColorConversionInfoTransformType : uint {

    /**
        Specifies a color conversion from a device 
        color space to a color profile.
    */
    fromSpace = 0,

    /**
        Specifies a color conversion from a 
        color profile to a device color space.
    */
    toSpace,

    /**
        Specifies a color conversion between one 
        color profile and another.
    */
    applySpace,
}

/**
    An option for whether to apply black point compensation when converting between color profiles.
*/
extern __gshared const CFStringRef kCGColorConversionBlackPointCompensation;

/**
    An object that describes how to convert between 
    color spaces for use by other system services. 
*/
alias CGColorConversionInfoRef = CFSubType!("CGColorConversionInfo");

/**
    Gets the type identifier for CGColorConversionInfo

    Returns:
        The Type ID of CGColorConversionInfo
*/
extern CFTypeID CGColorConversionInfoGetTypeID();

/**
    Creates a conversion between two specified color spaces.

    Params:
        src = The source color space
        dst = The destination color space

    Note:
        The color spaces **must** be calibrated.
        DeviceGray, DeviceRGB, DeviceCMYK, Indexed or DeviceN are not allowed.

    Returns:
        A new color conversion object on success,
        $(D null) otherwise.
*/
extern CGColorConversionInfoRef CGColorConversionInfoCreate(CGColorSpaceRef src, CGColorSpaceRef dst);

/**
    Creates a conversion between two specified color spaces.

    Params:
        src = The source color space
        dst = The destination color space
        options = Options for how the conversion should take place.

    Note:
        The color spaces **must** be calibrated.
        DeviceGray, DeviceRGB, DeviceCMYK, Indexed or DeviceN are not allowed.

    Returns:
        A new color conversion object on success,
        $(D null) otherwise.
*/
extern CGColorConversionInfoRef CGColorConversionInfoCreateWithOptions(CGColorSpaceRef src, CGColorSpaceRef dst, CFDictionaryRef options);
