/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGPattern
*/
module coregraphics.cgpattern;
import coregraphics.cggeometry;

extern(C) @nogc nothrow:

/**
    An abstraction for data-reading tasks that eliminates the need to manage a raw memory buffer.
*/
alias CGPatternRef = CFTypeRef;
