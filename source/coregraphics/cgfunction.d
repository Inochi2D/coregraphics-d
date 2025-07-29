/**
    CGFunction

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgfunction;
import coregraphics.cggeometry;
import coregraphics.cgcolor;
import corefoundation;

extern(C) @nogc nothrow:

/**
    Performs custom operations on the supplied input data to produce output data.
*/
alias CGFunctionEvaluateCallback = extern(C) void function(void* info, const(CGFloat)* in_, CGFloat* out_);

/**
    Performs custom clean-up tasks when Core Graphics deallocates a CGFunctionRef object.
*/
alias CGFunctionReleaseInfoCallback = extern(C) void function(void* info);

/**
    A structure that contains callbacks needed by a CGFunctionRef object.
*/
struct CGFunctionCallbacks {
    
    /**
        The callback that evaluates the function.
    */
    CGFunctionEvaluateCallback evaluate;
    
    /**
        If non-NULL,the callback used to release the info parameterpassed to CGFunctionCreate.
    */
    CGFunctionReleaseInfoCallback releaseInfo;
    
    /**
        The structure version number.
        
        For this structure,the version should be 0.
    */
    uint version_ = 0;
}

/**
    A general facility for defining and using callback functions.
*/
alias CGFunctionRef = CFSubType!("CGFunction");

/**
    Returns the type identifier for Core Graphics function objects.
*/
extern CFTypeID CGFunctionGetTypeID();

/**
    Creates a Core Graphics function.
*/
extern CGFunctionRef CGFunctionCreate(void* info, size_t domainDimension, const(CGFloat)* domain, size_t rangeDimension, const(CGFloat)* range, const(CGFunctionCallbacks)* callbacks);

/**
    Increments the retain count of a function object.
*/
extern CGFunctionRef CGFunctionRetain(CGFunctionRef func);

/**
    Decrements the retain count of a function object.
*/
extern void CGFunctionRelease(CGFunctionRef func);