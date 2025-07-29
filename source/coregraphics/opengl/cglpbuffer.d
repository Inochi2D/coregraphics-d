/**
    CGLPBuffer

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead.")
module coregraphics.opengl.cglpbuffer;
import coregraphics.opengl.cglcontext;
import coregraphics.opengl.cgltypes;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An OpenGL PBuffer Object
*/
alias CGLPBufferObj = CFSubType!("CGLPBufferObj");

/**
    Creates a new pixel buffer object.

    Params:
        width = Width of the pixel buffer
        height = Height of the pixel buffer
        target = Target mask of the pixel buffer
        internalFormat = The color format for the pixel buffer
        max_level = The maximum amount of mipmap levels for the pixel buffer.
        pbuffer = Where to store the pixel buffer object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLCreatePBuffer(int width, int height, uint target, uint internalFormat, int max_level, ref CGLPBufferObj pbuffer);

/**
    Destroys a pixel buffer object

    Params:
        pbuffer = The pixel buffer object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLDestroyPBuffer(CGLPBufferObj pbuffer);

/**
    Describes a pixel buffer's creation info.

    Params:
        obj = The pixel buffer object.
        width = The width of the pixel buffer object.
        height = The height of the pixel buffer object.
        target = The target of the pixel buffer object.
        internalFormat = The internal format of the pixel buffer object.
        mipmap = The mipmap levels of the pixel buffer object.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLDescribePBuffer(CGLPBufferObj obj, ref int width, ref int height, ref uint target, ref uint internalFormat, ref int mipmap);

/**
    Fills a pixel buffer with the given bound image.

    Params:
        ctx = The context.
        pbuffer = The pixel buffer object.
        source = The source texture bind slot.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLTexImagePBuffer(CGLContextObj ctx, CGLPBufferObj pbuffer, uint source);

/**
    Adds a reference to a pixel buffer object.

    Params:
        pbuffer = The pixel buffer object.
    
    Returns:
        The pixel buffer object.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLPBufferObj CGLRetainPBuffer(CGLPBufferObj pbuffer);

/**
    Releases a reference to a pixel buffer object

    Params:
        pbuffer = The pixel buffer object.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern void CGLReleasePBuffer(CGLPBufferObj pbuffer);

/**
    Gets the amount of references helf by the pixel buffer object.

    Params:
        pbuffer = The pixel buffer object.
    
    Returns:
        The amount of references the pixel buffer object holds.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern uint CGLGetPBufferRetainCount(CGLPBufferObj pbuffer);

/**
    Sets the active pixel buffer for a context.

    Params:
        ctx = The context.
        pbuffer = The pixel buffer object.
        face = The face the pixel buffer is bound to.
        level = The level the pixel buffer is bound to.
        screen = The screen the pixel buffer is bound to.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLSetPBuffer(CGLContextObj ctx, CGLPBufferObj pbuffer, uint face, int level, int screen);

/**
    Gets the active pixel buffer for a context.

    Params:
        ctx = The context.
        pbuffer = The pixel buffer object.
        face = The face the pixel buffer is bound to.
        level = The level the pixel buffer is bound to.
        screen = The screen the pixel buffer is bound to.
    
    Returns:
        $(D kCGLNoError) on success,
        non-zero error code otherwise.
*/
deprecated("PBuffers are deprecated, please use OpenGL framebuffers instead."):
extern CGLError CGLGetPBuffer(CGLContextObj ctx, ref CGLPBufferObj pbuffer, ref uint face, ref int level, ref int screen);
