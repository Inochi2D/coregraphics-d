/**
    CGLContext

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.opengl.cglcontext;
import coregraphics.opengl.cglpixelformat;
import coregraphics.opengl.cgltypes;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An OpenGL Context
*/
alias CGLContextObj = CFSubType!("CGLContextObj");

/**
    Creates a new OpenGL Context from a pixel format.

    Params:
        pix = The pixel format to be used by the context.
        share = A context the created context may share resources with, can be $(D null).
        ctx = The variable to store the newly created context in.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLCreateContext(CGLPixelFormatObj pix, CGLContextObj share, ref CGLContextObj ctx);

/**
    Destroys the given context.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDestroyContext(CGLContextObj ctx);

/**
    Copies the OpenGL state from one context to another.

    Params:
        src = The source context.
        dst = The destination context.
        mask = Bitmask of what context state to copy.
*/
extern CGLError CGLCopyContext(CGLContextObj src, CGLContextObj dst, uint mask);

/**
    Adds a reference to a context.

    Params:
        ctx = The context.
    
    Returns:
        The context.
*/
extern CGLPixelFormatObj CGLRetainContext(CGLContextObj ctx); 

/**
    Releases a reference to a context

    Params:
        ctx = The context.
*/
extern void CGLReleaseContext(CGLContextObj ctx);

/**
    Gets the amount of references helf by the context object.

    Params:
        ctx = The context.
    
    Returns:
        The amount of references the context object holds.
*/
extern uint CGLGetContextRetainCount(CGLContextObj ctx);

/**
    Gets the pixel format of the context.

    Params:
        ctx = The context.
    
    Returns:
        The pixel format object used to create the context,
        or $(D null) on failure.
*/
extern CGLPixelFormatObj CGLGetPixelFormat(CGLContextObj ctx);

/**
    Sets the current active context.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLSetCurrentContext(CGLContextObj ctx);

/**
    Gets the currently active OpenGL context for the calling
    thread.
    
    Returns:
        The active context on the thread,
        or $(D null) on failure.
*/
extern CGLContextObj CGLGetCurrentContext();

/**
    Clears the drawable that the context resides within.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLClearDrawable(CGLContextObj ctx);

/**
    Flushes the drawable that the context resides within.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLFlushDrawable(CGLContextObj ctx);

/**
    Enables a property for the given context.

    Params:
        ctx = The context.
        pname = The name of the property to enable.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLEnable(CGLContextObj ctx, CGLContextEnable pname);

/**
    Disables a property for the given context.

    Params:
        ctx = The context.
        pname = The name of the property to enable.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLDisable(CGLContextObj ctx, CGLContextEnable pname);

/**
    Gets whether a property for the given context is enabled.

    Params:
        ctx = The context.
        pname = The name of the property to enable.
        enabled = Where to store the enable state.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLIsEnabled(CGLContextObj ctx, CGLContextEnable pname, ref int enabled);

/**
    Sets a parameter for the given context.

    Params:
        ctx = The context.
        pname = The name of the parameter to set.
        params = The values to assign to the parameter.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLSetParameter(CGLContextObj ctx, CGLContextParameter pname, const(int)* params);

/**
    Sets a parameter for the given context.

    Params:
        ctx = The context.
        pname = The name of the parameter to set.
        params = Where to store the parameters.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLGetParameter(CGLContextObj ctx, CGLContextParameter pname, int* params);

/**
    Sets the virtual screen for a context.

    Params:
        ctx = The context.
        screen = The ID of the virtual screen to use.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLSetVirtualScreen(CGLContextObj ctx, int screen);

/**
    Gets the virtual screen for a context.

    Params:
        ctx = The context.
        screen = Where to store the screen ID.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLGetVirtualScreen(CGLContextObj ctx, ref int screen);

/**
    Updates the state of the context.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLUpdateContext(CGLContextObj ctx);

/**
    Locks the context in a multithreaded setting.

    This **must** be paired with a $(D CGLUnlockContext) call.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLLockContext(CGLContextObj ctx);

/**
    Unlocks the context in a multithreaded setting.

    Params:
        ctx = The context.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
extern CGLError CGLUnlockContext(CGLContextObj ctx);
