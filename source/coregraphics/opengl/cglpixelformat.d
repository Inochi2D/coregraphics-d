/**
    CGLPixelFormat

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.opengl.cglpixelformat;
import coregraphics.opengl.cgltypes;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An OpenGL Pixel Format
*/
alias CGLPixelFormatObj = CFSubType!("CGLPixelFormatObj");

/**
    Chooses a pixel format with the given attributes.

    Params:
        attribs = A zero-terminated array of key-value pairs of attributes.
        pix = The destination CGLPixelFormatObj to store the format in.
        npix = The amount of stored pixel formats in the object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLChoosePixelFormat(const(CGLPixelFormatAttribute)* attribs, ref CGLPixelFormatObj pix, ref int npix); 

/**
    Destroys a pixel format object.

    Params:
        pix = The pixel format.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDestroyPixelFormat(CGLPixelFormatObj pix);

/**
    Describes the pixel format.

    Params:
        pix = The pixel format.
        pix_num = The specific sub-format to query.
        attrib = The attribute to query.
        value = Where to store the description.

    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDescribePixelFormat(CGLPixelFormatObj pix, int pix_num, CGLPixelFormatAttribute attrib, ref int value);

/**
    Releases a reference to a pixel format object

    Params:
        pix = The pixel format.
*/
extern void CGLReleasePixelFormat(CGLPixelFormatObj pix);

/**
    Adds a reference to a pixel format object.

    Params:
        pix = The pixel format.
    
    Returns:
        The pixel format object.
*/
extern CGLPixelFormatObj CGLRetainPixelFormat(CGLPixelFormatObj pix); 

/**
    Gets the amount of references helf by the pixel format object.

    Params:
        pix = The pixel format.
    
    Returns:
        The amount of references the pixel format object holds.
*/
extern uint CGLGetPixelFormatRetainCount(CGLPixelFormatObj pix);