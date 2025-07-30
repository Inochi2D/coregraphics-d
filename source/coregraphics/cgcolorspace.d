/**
    CGColorSpace

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgcolorspace;
import coregraphics.cggeometry;
import coregraphics.cgdata;

import corefoundation.cfstring;
import corefoundation.cfdata;
import corefoundation;

extern(C) @nogc nothrow:

/**
    A profile that specifies how to interpret a color value for display.
*/
alias CGColorSpaceRef = CFSubType!("CGColorSpace");

/**
    Handling options for colors that are not located within 
    the destination color space of a graphics context.
*/
enum CGColorRenderingIntent : int {
    
    /**
        The default rendering intent for the graphics context.
    */
    default_,
    
    /**
        The absolute colorimetric rendering intent for the graphics context.
    */
    absoluteColorimetric,
    
    /**
        The relative colorimetric rendering intent for the graphics context.
    */
    relativeColorimetric,
    
    /**
        Preserve the visual relationship between colors by compressing the gamut of the 
        graphics context to fit inside the gamut of the output device. 
        
        Perceptual intent is good for photographs and other complex, detailed images.
    */
    perceptual,
    
    /**
        The saturation rendering intent for the graphics context.
    */
    saturation
}

/**
    Colorspace models.
*/
enum CGColorSpaceModel : int {
    
    /**
        An unknown color space model.
    */
    unknown = -1,
    
    /**
        A monochrome color space model.
    */
    monchrome,
    
    /**
        An RGB color space model.
    */
    rgb,
    
    /**
        A CMYK color space model.
    */
    cmyk,
    
    /**
        The CIE L\*a\*b\* color space model.
    */
    lab,
    
    /**
        A DeviceN color space model.
    */
    deviceN,
    
    /**
        An indexed color space model.
    */
    indexed,
    
    /**
        A pattern color space model.
    */
    pattern,
    
    /**
        The CIE 1931 XYZ-space color space model.
    */
    xyz
}

/**
    A 3D point within the CIE 1931 XYZ-space
*/
struct CGColorPoint {
    CGFloat x;
    CGFloat y;
    CGFloat z;
}

/**
    A 3x3 matric within the CIE 1931 XYZ-space
*/
alias CGColorMatrix = CGFloat[3][3];

/**
    Name of a generic gray color space.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericGray;

/**
    Name of a generic gray color space with γ = 2.2.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericGrayGamma2_2;

/**
    Name of a generic sRGB color space.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericRGB;

/**
    Name of the standard sRGB color space.
*/
extern __gshared const CFStringRef kCGColorSpaceSRGB;

/**
    Name of a generic linear RGB color space.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericRGBLinear;

/**
    Name of the Adobe RGB (1998) color space color space.
*/
extern __gshared const CFStringRef kCGColorSpaceAdobeRGB1998;

/**
    Name of a generic CMYK color space.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericCMYK;

/**
    Name of a generic XYZ color space.
*/
extern __gshared const CFStringRef kCGColorSpaceGenericXYZ;

/**
    Name of a display P3 color space.
*/
extern __gshared const CFStringRef kCGColorSpaceDisplayP3;

/**
    Gets the type identifier for CGColorSpace

    Returns:
        The Type ID of CGColorSpace
*/
extern CFTypeID CGColorSpaceGetTypeID();

/**
    Creates a device-dependent grayscale color space.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceGray();

/**
    Creates a device-dependent RGB color space.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceRGB();

/**
    Creates a device-dependent CMYK color space.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateDeviceCMYK();

/**
    Creates a color space which matches the given name reference.

    Params:
        name = The name of the color space to create.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name);

/**
    Creates a calibrated grayscale color space.

    Params:
        whitePoint =    The coordinates of the whitepoint within the CIE 1931 XYZ-space.
        blackPoint =    The coordinates of the blackpoint within the CIE 1931 XYZ-space,
                        set to $(D null) for zero blackpoint.
        gamma =         The gamma for the gray component
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateCalibratedGray(ref const(CGColorPoint) whitePoint, const(CGColorPoint)* blackPoint, CGFloat gamma);

/**
    Creates a calibrated RGB color space.

    Params:
        whitePoint =    The coordinates of the whitepoint within the CIE 1931 XYZ-space.
        blackPoint =    The coordinates of the blackpoint within the CIE 1931 XYZ-space,
                        set to $(D null) for zero blackpoint.
        gamma =         Gamma factor for the color components,
                        set to $(D null) for linear gamma.
        matrix =        The 3x3 matrix specifying the linear interpretation of the
                        gamma-modified RGB values,
                        set to $(D null) for identity matrix.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateCalibratedRGB(ref const(CGColorPoint) whitePoint, const(CGColorPoint)* blackPoint, const(CGColorPoint)* gamma, const(CGColorMatrix)* matrix);

/**
    Creates a device-independent color space that is relative 
    to human color perception, according to the CIE L\*a\*b\* standard.
    
    Params:
        whitePoint =    The coordinates of the whitepoint within the CIE 1931 XYZ-space.
        blackPoint =    The coordinates of the blackpoint within the CIE 1931 XYZ-space,
                        set to $(D null) for zero blackpoint.
        range =         The range of valid values for the a\* and b\* components of the
                        color space, set to $(D null) for a -100..100 range.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateLab(ref const(CGColorPoint) whitePoint, const(CGColorPoint)* blackPoint, const(CGFloat)[4]* range);

/**
    Creates a device-independent color space that is defined 
    according to the ICC color profile specification.
    
    Params:
        nComponents =   The number of components
        range =         A $(D 2*nComponents) slice containing the valid
                        ranges for each component.
        profile =       The data provider specifying the ICC profile.
        alternate =     An alternate color space to return if the profile
                        is not supported, may be $(D null).

    Returns:
        A new colorspace object, either based on the ICC profile
        provided, the alternate if specfied, an automatically 
        selected alternate is returned otherwise based on the
        component count.
*/
extern CGColorSpaceRef CGColorSpaceCreateICCBased(size_t nComponents, const(CGFloat)* range, CGDataProviderRef profile, CGColorSpaceRef alternate);

/**
    Creates an indexed color space, consisting of 
    colors specified by a color lookup table.
    
    Params:
        baseSpace =     The colorspace to index within.
        lastIndex =     The highest index in the colorspace's lookup table,
                        must be 255 or lower.
        colorTable =    Slice of colors that should be indexed within, must be
                        at least $(D channelCount * (lastIndex + 1)) in length.
                        Each byte is scaled to the baseSpace's color range.

    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreateIndexed(CGColorSpaceRef baseSpace, size_t lastIndex, const(ubyte)* colorTable);

/**
    Creates a pattern color space.

    Params:
        baseSpace = The base color space to use for the pattern colorspace,
                    for colored patterns this should be $(D null), otherwise
                    it should be a valid CGColorSpaceRef object.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace);

/**
    Increments the retain count of a colorspace.

    Params:
        color = The colorspace object.
    
    Returns:
        The colorspace object.
*/
extern CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space);

/**
    Decrements the retain count of a colorspace.

    Params:
        color = The color object.
*/
extern void CGColorSpaceRelease(CGColorSpaceRef space);

/**
    Returns a copy of the ICC profile data of the provided color space.

    Params:
        color = The colorspace object.
    
    Returns:
        A $(D CFData) object containing the ICC profile data.
*/
extern CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space);

/**
    Gets whether the color space can be used as a destination color space.

    Params:
        color = The colorspace object.

    Returns:
        $(D true) if the colorspace can be used as a
        destination colorspace, $(D false) otherwise.
*/
extern bool CGColorSpaceSupportsOutput(CGColorSpaceRef space);

/**
    Gets the number of color components in a color space.

    Params:
        color = The colorspace object.
    
    Returns:
        The number of components in the color space.
*/
extern size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space);

/**
    Gets the color space model of the provided color space.

    Params:
        color = The colorspace object.
    
    Returns:
        The color space model.
*/
extern CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space);

/**
    Gets whether the color space covers a significant 
    portion of the NTSC color gamut.

    Params:
        color = The colorspace object.

    Returns:
        $(D true) if the colorspace covers a large portion
        of the NTSC color gamut, $(D false) otherwise.
*/
extern bool CGColorSpaceIsWideGamutRGB(CGColorSpaceRef);

/**
    Gets whether the color space is capable of displaying
    colors of high dynamic range.

    Params:
        color = The colorspace object.

    Returns:
        $(D true) if the colorspace is HDR,
        $(D false) otherwise.
*/
extern bool CGColorSpaceIsHDR(CGColorSpaceRef);

/**
    Gets the base color space of a pattern or 
    indexed color space.

    Params:
        color = The colorspace object.
    
    Returns:
        A new colorspace object on success,
        $(D null) otherwise.
*/
extern CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space);

/**
    Gets the number of entries in the color table 
    of an indexed color space.

    Params:
        color = The colorspace object.
    
    Returns:
        The number of entries in the indexed color table,
        $(D 0) if the colorspace is not indexed.
*/
extern size_t CGColorSpaceGetColorTableCount(CGColorSpaceRef space);

/**
    Copies the entries in the color table of 
    an indexed color space. 

    Params:
        color = The colorspace object.
        table = The destination to write to.
*/
extern void CGColorSpaceGetColorTable(CGColorSpaceRef space, ubyte* table);

/**
    Returns the name used to create the specified color space.
    
    Returns:
        A CFString with the name of the color space,
        $(D null) if the color space has no name.
*/
extern CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space);
