/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGImage
*/
module coregraphics.cgimage;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

/**
    A bitmap image or image mask.
*/
alias CGImageRef = CFTypeRef;