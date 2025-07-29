/**
    CGLRendererInfo

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.opengl.cglrendererinfo;
import coregraphics.opengl.cgltypes;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An OpenGL Renderer Info Object
*/
alias CGLRendererInfoObj = CFSubType!("CGLRendererInfoObj");

/**
    Queries information about the renderer/driver in use.

    Params:
        display_mask = Mask to describe which display to describe the renderer of.
        rend = The location to store the renderer info object.
        nrend = The amount of renderer information stored within the object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLQueryRendererInfo(uint display_mask, ref CGLRendererInfoObj rend, ref int nrend);

/**
    Destroys the renderer info object.

    Params:
        rend = The renderer info object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDestroyRendererInfo(CGLRendererInfoObj rend);

/**
    Describes a property of the given renderer.

    Params:
        rend = The renderer info object.
        rend_num = The renderer information within the object to query.
        prop = The property to query.
        value = Where to store the description.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDescribeRenderer(CGLRendererInfoObj rend, int rend_num, CGLRendererProperty prop, ref int value);
