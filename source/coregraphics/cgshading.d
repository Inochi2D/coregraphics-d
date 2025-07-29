/**
    CGShading

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgshading;
import coregraphics.cggeometry;
import coregraphics.cgcolor;
import coregraphics.cgfunction;
import corefoundation;

extern(C) @nogc nothrow:


/**
    A definition for a smooth transition between colors, 
    controlled by a custom function you provide, 
    for drawing radial and axial gradient fills.
*/
alias CGShadingRef = CFTypeRef;

/**
    Returns the Core Foundation type identifier for Core Graphics shading objects.
*/
extern CFTypeID CGShadingGetTypeID();

/**
    Increments the retain count of a shading object.
*/
extern CGShadingRef CGShadingRetain(CGShadingRef shading);

/**
    Decrements the retain count of a shading object.
*/
extern void CGShadingRelease(CGShadingRef shading);

/**
    Creates a shading object to use for axial shading.
*/
extern CGShadingRef CGShadingCreateAxial(CGColorSpaceRef space, CGPoint start, CGPoint end, CGFunctionRef func, bool extendStart, bool extendEnd);

/**
    Creates a shading object to use for radial shading.
*/
extern CGShadingRef CGShadingCreateRadial(CGColorSpaceRef space, CGPoint start, CGFloat startRadius, CGPoint end, CGFloat endRadius, CGFunctionRef func, bool extendStart, bool extendEnd);