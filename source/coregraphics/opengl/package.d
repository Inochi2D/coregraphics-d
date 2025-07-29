/**
    Bindings to Apple's CoreGraphics OpenGL API

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.opengl;

extern(C) @nogc nothrow:

public import coregraphics.opengl.cgltypes;
public import coregraphics.opengl.cglcontext;
public import coregraphics.opengl.cglpixelformat;
public import coregraphics.opengl.cglrendererinfo;


/**
    Gets the currently loaded OpenGL Version.

    Params:
        major = Where to store the major version number
        minor = Where to store the minor version number
*/
extern void CGLGetVersion(ref int major, ref int minor);

/**
    Gets an error string from a CGLError enum.

    Params:
        error = The error code to query

    Returns:
        A string describing the error,
        $(D null) if the error could not be described.
*/
extern const(char)* CGLErrorString(CGLError error);

/**
    Sets a global OpenGL option.

    Params:
        pname = The option to set
        params = The values to set the option to.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLSetGlobalOption(CGLGlobalOption pname, const(int)* params);

/**
    Sets a global OpenGL option.

    Params:
        pname = The option to set
        params = Where to store the values of the option to.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLGetGlobalOption(CGLGlobalOption pname, int* params);
