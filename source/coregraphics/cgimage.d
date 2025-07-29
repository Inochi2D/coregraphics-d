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

/**
    A bitmap image or image mask.
*/
alias CGImageRef = CFSubType!("CGImage");