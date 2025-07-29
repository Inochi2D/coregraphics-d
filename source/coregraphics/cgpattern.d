/**
    CGPattern

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgpattern;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An abstraction for data-reading tasks that eliminates the need to manage a raw memory buffer.
*/
alias CGPatternRef = CFSubType!("CGPattern");
