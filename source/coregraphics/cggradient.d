/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGGradient
*/
module coregraphics.cggradient;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

/**
    Drawing locations for gradients.
*/
enum CGGradientDrawingOptions : uint {
    
    /**
        The fill should extend beyond the starting location. 
        The color that extends beyond the starting point is the solid color defined by the 
        CGGradientRef object to be at location 0.
    */
    DrawsBeforeStart = (1 << 0),
    
    /**
        The fill should extend beyond the ending location. 
        The color that extends beyond the ending point is the solid 
        color defined by the CGGradientRef object to be at location 1.
    */
    DrawsAfterEnd = (1 << 1),
}

/**
    A definition for a smooth transition between colors for drawing radial and axial gradient fills.
*/
alias CGGradientRef = CFTypeRef;