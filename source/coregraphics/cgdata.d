/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGDataProvider, CGDataConsumer.
*/
module coregraphics.cgdata;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An abstraction for data-reading tasks that eliminates the need to manage a raw memory buffer.
*/
alias CGDataProviderRef = CFTypeRef;

/**
    An abstraction for data-writing tasks that eliminates the need to manage a raw memory buffer.
*/
alias CGDataConsumerRef = CFTypeRef;