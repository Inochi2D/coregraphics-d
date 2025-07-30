/**
    CGImage

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgimage;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

alias CGImageAlphaInfo = uint;
enum : CGImageAlphaInfo {
    kCGImageAlphaNone,               /* For example, RGB. */
    kCGImageAlphaPremultipliedLast,  /* For example, premultiplied RGBA */
    kCGImageAlphaPremultipliedFirst, /* For example, premultiplied ARGB */
    kCGImageAlphaLast,               /* For example, non-premultiplied RGBA */
    kCGImageAlphaFirst,              /* For example, non-premultiplied ARGB */
    kCGImageAlphaNoneSkipLast,       /* For example, RGBX. */
    kCGImageAlphaNoneSkipFirst,      /* For example, XRGB. */
    kCGImageAlphaOnly                /* No color data, alpha data only */
}

alias CGImageByteOrderInfo = uint;
enum : CGImageByteOrderInfo {
    kCGImageByteOrderMask     = 0x7000,
    kCGImageByteOrderDefault  = (0 << 12),
    kCGImageByteOrder16Little = (1 << 12),
    kCGImageByteOrder32Little = (2 << 12),
    kCGImageByteOrder16Big    = (3 << 12),
    kCGImageByteOrder32Big    = (4 << 12)
}

alias CGImagePixelFormatInfo = uint;
enum : CGImagePixelFormatInfo {
    kCGImagePixelFormatMask      = 0xF0000,
    kCGImagePixelFormatPacked    = (0 << 16),
    kCGImagePixelFormatRGB555    = (1 << 16), /* Only for RGB 16 bits per pixel, alpha != alpha none */
    kCGImagePixelFormatRGB565    = (2 << 16), /* Only for RGB 16 bits per pixel, alpha none */
    kCGImagePixelFormatRGB101010 = (3 << 16), /* Only for RGB 32 bits per pixel, alpha != none */
    kCGImagePixelFormatRGBCIF10  = (4 << 16)  /* Only for RGB 32 bits per pixel,
                                               * 10 bits per component, kCGImageByteOrder32Little
                                               * The 2 MSB of the pixel need to be set to 1 */
}

alias CGBitmapInfo = uint;
enum : CGBitmapInfo {
    kCGBitmapAlphaInfoMask = 0x1F,
    kCGBitmapFloatInfoMask = 0xF00,
    kCGBitmapFloatComponents = (1 << 8),
    kCGBitmapByteOrderMask     = kCGImageByteOrderMask,
    kCGBitmapByteOrderDefault  = kCGImageByteOrderDefault,
    kCGBitmapByteOrder16Little = kCGImageByteOrder16Little,
    kCGBitmapByteOrder32Little = kCGImageByteOrder32Little,
    kCGBitmapByteOrder16Big    = kCGImageByteOrder16Big,
    kCGBitmapByteOrder32Big    = kCGImageByteOrder32Big
}

/**
    A bitmap image or image mask.
*/
alias CGImageRef = CFSubType!("CGImage");