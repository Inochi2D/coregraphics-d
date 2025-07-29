/**
    CGColor

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgcolor;
import coregraphics.cggeometry;
import coregraphics.cgpattern;
import coregraphics.cgdata;

import corefoundation.cfstring;
import corefoundation.cfdictionary;
import corefoundation.cfdata;
import corefoundation;

extern(C) @nogc nothrow:

/**
    A set of components that define a color, with a color space specifying how to interpret them.
*/
alias CGColorRef = CFTypeRef;

/**
    Returns the Core Foundation type identifier for a color data type.
*/
extern CFTypeID CGColorGetTypeID();

/**
    Returns a color object that represents a constant color.
*/
extern CGColorRef CGColorGetConstantColor(CFStringRef colorName);

/**
    Increments the retain count of a color.
*/
extern CGColorRef CGColorRetain(CGColorRef color);

/**
    Decrements the retain count of a color.
*/
extern void CGColorRelease(CGColorRef color);

/**
    Creates a color using a list of intensity values (including alpha) and an associated color space.
*/
extern CGColorRef CGColorCreate(CGColorSpaceRef space, const(CGFloat)* components);

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



//
//          CGColorConversionInfo
//

/**
    Constants describing how a color conversion uses color spaces.
*/
enum CGColorConversionInfoTransformType : uint {
    
    /**
        Specifies a color conversion between one color profile and another.
    */
    ApplySpace,
    
    /**
        Specifies a color conversion from a device color space to a color profile.
    */
    FromSpace,
    
    /**
        Specifies a color conversion from a color profile to a device color space.
    */
    ToSpace,
}

/**
    An object that describes how to convert between color spaces for use by other system services. 
*/
alias CGColorConversionInfoRef = CFTypeRef;

/**
    Returns the Core Foundation type identifier for a color conversion info data type.
*/
extern CFTypeID CGColorConversionInfoGetTypeID();

/**
    Creates a conversion between two specified color spaces.
*/
extern CGColorConversionInfoRef CGColorConversionInfoCreate(CGColorSpaceRef src, CGColorSpaceRef dst);

/**
    Creates a conversion between an arbitrary number of specified color spaces. 
*/
extern CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef, CGColorConversionInfoTransformType, CGColorRenderingIntent, ...);

/**
    An option for whether to apply black point compensation when converting between color profiles.
*/
extern __gshared const CFStringRef kCGColorConversionBlackPointCompensation;



//
//          CGColorSpace
//

/**
    Models for color spaces.
*/
enum CGColorSpaceModel : int {
    
    /**
        An unknown color space model.
    */
    Unknown,
    
    /**
        A monochrome color space model.
    */
    Monochrome,
    
    /**
        An RGB color space model.
    */
    RGB,
    
    /**
        A CMYK color space model.
    */
    CMYK,
    
    /**
        A Lab color space model.
    */
    Lab,
    
    /**
        A DeviceN color space model.
    */
    DeviceN,
    
    /**
        An indexed color space model.
    */
    Indexed,
    
    /**
        A pattern color space model.
    */
    Pattern,
    
    /**
        An XYZ color space model.
    */
    XYZ
}

/**
    Handling options for colors that are not located within the destination color space of a graphics context.
*/
enum CGColorRenderingIntent : int {
    
    /**
        The default rendering intent for the graphics context.
    */
    Default,
    
    /**
        The absolute colorimetric rendering intent for the graphics context.
    */
    AbsoluteColorimetric,
    
    /**
        The relative colorimetric rendering intent for the graphics context.
    */
    RelativeColorimetric,
    
    /**
        Preserve the visual relationship between colors by compressing the gamut of the 
        graphics context to fit inside the gamut of the output device. 
        
        Perceptual intent is good for photographs and other complex, detailed images.
    */
    Perceptual,
    
    /**
        The saturation rendering intent for the graphics context.
    */
    Saturation
}

/**
    A profile that specifies how to interpret a color value for display.
*/
alias CGColorSpaceRef = CFTypeRef;

/**
    Returns the Core Foundation type identifier for Quartz color spaces.
*/
extern CFTypeID CGColorSpaceGetTypeID();

/**
    Increments the retain count of a color space.
*/
extern CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space);

/**
    Decrements the retain count of a color space.
*/
extern void CGColorSpaceRelease(CGColorSpaceRef space);

/**
    Creates a calibrated grayscale color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateCalibratedGray(const(CGFloat)* whitePoint, const(CGFloat)* blackPoint, CGFloat gamma);

/**
    Creates a calibrated RGB color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(const(CGFloat)* whitePoint, const(CGFloat)* blackPoint, const(CGFloat)* gamma, const(CGFloat)* matrix);

/**
    Creates a device-independent color space that is defined according to the ICC color profile specification.
*/
extern CGColorSpaceRef CGColorSpaceCreateICCBased(size_t nComponents, const(CGFloat)* range, CGDataProviderRef profile, CGColorSpaceRef alternate);

/**
    Creates a device-independent color space that is relative to human color perception, according to the CIE L*a*b* standard.
*/
extern CGColorSpaceRef CGColorSpaceCreateLab(const(CGFloat)* whitePoint, const(CGFloat)* blackPoint, const(CGFloat)* range);

/**
    Creates a device-dependent CMYK color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceCMYK();

/**
    Creates a device-dependent grayscale color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceGray();

/**
    Creates a device-dependent RGB color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceRGB();

/**
    Creates an indexed color space, consisting of colors specified by a color lookup table.
*/
extern CGColorSpaceRef CGColorSpaceCreateIndexed(CGColorSpaceRef baseSpace, size_t lastIndex, const(ubyte)* colorTable);

/**
    Creates a pattern color space.
*/
extern CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace);

/**
    Creates a specified type of Quartz color space.
*/
extern CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name);

/**
    Returns a copy of the ICC profile data of the provided color space.
*/
extern CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space);

/**
    Returns a Boolean indicating whether the color space can be used as a destination color space.
*/
extern bool CGColorSpaceSupportsOutput(CGColorSpaceRef space);

/**
    Returns the number of color components in a color space.
*/
extern size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space);

/**
    Returns the color space model of the provided color space.
*/
extern CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space);

/**
    Returns whether the RGB color space covers a significant portion of the NTSC color gamut.
*/
extern bool CGColorSpaceIsWideGamutRGB(CGColorSpaceRef);

/**
    Returns the base color space of a pattern or indexed color space.
*/
extern CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space);

/**
    Returns the number of entries in the color table of an indexed color space.
*/
extern size_t CGColorSpaceGetColorTableCount(CGColorSpaceRef space);

/**
    Copies the entries in the color table of an indexed color space. 
*/
extern void CGColorSpaceGetColorTable(CGColorSpaceRef space, ubyte* table);

/**
    Returns the name used to create the specified color space.
*/
extern CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space);
