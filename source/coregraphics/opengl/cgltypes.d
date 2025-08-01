/**
    CGLTypes

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.opengl.cgltypes;

//
//              Attribute names for CGLChoosePixelFormat and CGLDescribePixelFormat.
//
alias CGLPixelFormatAttribute = uint;
enum : CGLPixelFormatAttribute {
    kCGLPFAAllRenderers = 1, /* choose from all available renderers          */
    kCGLPFATripleBuffer = 3, /* choose a triple buffered pixel format        */
    kCGLPFADoubleBuffer = 5, /* choose a double buffered pixel format        */
    kCGLPFAColorSize = 8, /* number of color buffer bits                  */
    kCGLPFAAlphaSize = 11, /* number of alpha component bits               */
    kCGLPFADepthSize = 12, /* number of depth buffer bits                  */
    kCGLPFAStencilSize = 13, /* number of stencil buffer bits                */
    kCGLPFAMinimumPolicy = 51, /* never choose smaller buffers than requested  */
    kCGLPFAMaximumPolicy = 52, /* choose largest buffers of type requested     */
    kCGLPFASampleBuffers = 55, /* number of multi sample buffers               */
    kCGLPFASamples = 56, /* number of samples per multi sample buffer    */
    kCGLPFAColorFloat = 58, /* color buffers store floating point pixels    */
    kCGLPFAMultisample = 59, /* choose multisampling                         */
    kCGLPFASupersample = 60, /* choose supersampling                         */
    kCGLPFASampleAlpha = 61, /* request alpha filtering                      */
    kCGLPFARendererID = 70, /* request renderer by ID                       */
    kCGLPFANoRecovery = 72, /* disable all failure recovery systems         */
    kCGLPFAAccelerated = 73, /* choose a hardware accelerated renderer       */
    kCGLPFAClosestPolicy = 74, /* choose the closest color buffer to request   */
    kCGLPFABackingStore = 76, /* back buffer contents are valid after swap    */
    kCGLPFABackingVolatile = 77, /* back buffer contents are volatile after swap */
    kCGLPFADisplayMask = 84, /* mask limiting supported displays             */
    kCGLPFAAllowOfflineRenderers = 96, /* show offline renderers in pixel formats      */
    kCGLPFAAcceleratedCompute = 97, /* choose a hardware accelerated compute device */
    kCGLPFAOpenGLProfile = 99, /* specify an OpenGL Profile to use             */
    kCGLPFASupportsAutomaticGraphicsSwitching = 101, /* responds to display changes                  */
    kCGLPFAVirtualScreenCount = 128, /* number of virtual screens in this format     */

    /* Note: the following attributes are deprecated in Core Profile                    */
    kCGLPFAAuxBuffers = 7, /* number of aux buffers                        */
    kCGLPFAAccumSize = 14, /* number of accum buffer bits                  */
    kCGLPFAAuxDepthStencil = 57, /* each aux buffer has its own depth stencil    */

    kCGLPFAStereo = 6,
    kCGLPFAOffScreen = 53,
    kCGLPFAWindow = 80,
    kCGLPFACompliant = 83,
    kCGLPFAPBuffer = 90,
    kCGLPFARemotePBuffer = 91,

    kCGLPFASingleRenderer = 71,
    kCGLPFARobust = 75,
    kCGLPFAMPSafe = 78,
    kCGLPFAMultiScreen = 81,
    kCGLPFAFullScreen = 54,
}

//
//              Property names for CGLDescribeRenderer.
//
alias CGLRendererProperty = uint;
enum : CGLRendererProperty {
    kCGLRPOffScreen = 53,
    kCGLRPRendererID = 70,
    kCGLRPAccelerated = 73,
    kCGLRPBackingStore = 76,
    kCGLRPWindow = 80,
    kCGLRPCompliant = 83,
    kCGLRPDisplayMask = 84,
    kCGLRPBufferModes = 100, /* a bitfield of supported buffer modes             */
    kCGLRPColorModes = 103, /* a bitfield of supported color buffer formats     */
    kCGLRPAccumModes = 104, /* a bitfield of supported accum buffer formats     */
    kCGLRPDepthModes = 105, /* a bitfield of supported depth buffer depths      */
    kCGLRPStencilModes = 106, /* a bitfield of supported stencil buffer depths    */
    kCGLRPMaxAuxBuffers = 107, /* maximum number of auxilliary buffers             */
    kCGLRPMaxSampleBuffers = 108, /* maximum number of sample buffers                 */
    kCGLRPMaxSamples = 109, /* maximum number of samples                        */
    kCGLRPSampleModes = 110, /* a bitfield of supported sample modes             */
    kCGLRPSampleAlpha = 111, /* support for alpha sampling                       */
    kCGLRPGPUVertProcCapable = 122, /* renderer capable of GPU vertex processing        */
    kCGLRPGPUFragProcCapable = 123, /* renderer capable of GPU fragment processing      */
    kCGLRPRendererCount = 128, /* the number of renderers in this renderer info    */
    kCGLRPOnline = 129, /* a boolean stating if renderer is on/offline      */
    kCGLRPAcceleratedCompute = 130, /* hardware accelerated compute device              */
    kCGLRPVideoMemoryMegabytes = 131, /* total video memory (in megabytes)                */
    kCGLRPTextureMemoryMegabytes = 132, /* video memory useable for textures (in megabytes) */
    kCGLRPMajorGLVersion = 133, /* maximum supported major GL revision              */

    kCGLRPRegistryIDLow = 140, /* Low 32-bits of registryID */
    kCGLRPRegistryIDHigh = 141, /* High 32-bits of registryID */
    kCGLRPRemovable = 142, /* renderer is removable (eGPU) */

    kCGLRPRobust = 75,
    kCGLRPMPSafe = 78,
    kCGLRPMultiScreen = 81,
    kCGLRPFullScreen = 54,
}

//
//              Enable names for CGLEnable, CGLDisable, and CGLIsEnabled.
//
alias CGLContextEnable = uint;
enum : CGLContextEnable {
    kCGLCESwapRectangle = 201, /* Enable or disable the swap rectangle              */
    kCGLCESwapLimit = 203, /* Enable or disable the swap async limit            */
    kCGLCERasterization = 221, /* Enable or disable all rasterization               */
    kCGLCEStateValidation = 301, /* Validate state for multi-screen functionality     */
    kCGLCESurfaceBackingSize = 305, /* Enable or disable surface backing size override   */
    kCGLCEDisplayListOptimization = 307, /* Ability to turn off display list optimizer        */
    kCGLCEMPEngine = 313, /* Enable or disable multi-threaded GL engine        */
    kCGLCECrashOnRemovedFunctions = 316 /* Die on call to function removed from Core Profile */
}

//
//              GPURestartStatus names
//
alias CGLGPURestartStatus = uint;
enum : CGLGPURestartStatus { /* GPU Restart Status */
    kCGLCPGPURestartStatusNone = 0, /* current context has not caused recent GPU restart */
    kCGLCPGPURestartStatusCaused = 1, /* current context caused recent GPU restart (auto-clear on query) */
    kCGLCPGPURestartStatusBlacklisted = 2, /* current context is being ignored for excessive GPU restarts (won't clear on query) */
    kCGLCPGPURestartStatusDenied = 2, /* current context is being ignored for excessive GPU restarts (won't clear on query) */
}

//
//              Parameter names for CGLSetParameter and CGLGetParameter.
//
alias CGLContextParameter = uint;
enum : CGLContextParameter {
    kCGLCPSwapRectangle = 200, /* 4 params.  Set or get the swap rectangle {x, y, w, h}        */
    kCGLCPSwapInterval = 222, /* 1 param.   0 -> Don't sync, 1 -> Sync to vertical retrace    */
    kCGLCPDispatchTableSize = 224, /* 1 param.   Get the dispatch table size                       */
    /* Note: kCGLCPClientStorage is always a pointer-sized parameter, even though the API claims GLint. */
    kCGLCPClientStorage = 226, /* 1 param.   Context specific generic storage                  */
    kCGLCPSurfaceTexture = 228, /* 3 params.  Context, target, internal_format                  */
    /*  - Used by AGL - */
    /*  AGL_STATE_VALIDATION                                       230 */
    /*  AGL_BUFFER_NAME                                            231 */
    /*  AGL_ORDER_CONTEXT_TO_FRONT                                 232 */
    /*  AGL_CONTEXT_SURFACE_ID                                     233 */
    /*  AGL_CONTEXT_DISPLAY_ID                                     234 */
    kCGLCPSurfaceOrder = 235, /* 1 param.   1 -> Above window, -1 -> Below Window             */
    kCGLCPSurfaceOpacity = 236, /* 1 param.   1 -> Surface is opaque (default), 0 -> non-opaque */
    /*  - Used by AGL - */
    /*  AGL_CLIP_REGION                                            254 */
    /*  AGL_FS_CAPTURE_SINGLE                                      255 */
    kCGLCPSurfaceBackingSize = 304, /* 2 params.  Width/height of surface backing size              */
    /*  AGL_SURFACE_VOLATILE                                       306 */
    kCGLCPSurfaceSurfaceVolatile = 306, /* 1 param.   Surface volatile state                            */
    kCGLCPReclaimResources = 308, /* 0 params.                                                    */
    kCGLCPCurrentRendererID = 309, /* 1 param.   Retrieves the current renderer ID                 */
    kCGLCPGPUVertexProcessing = 310, /* 1 param.   Currently processing vertices with GPU (get)      */
    kCGLCPGPUFragmentProcessing = 311, /* 1 param.   Currently processing fragments with GPU (get)     */
    kCGLCPHasDrawable = 314, /* 1 param.   Boolean returned if drawable is attached			*/
    kCGLCPMPSwapsInFlight = 315, /* 1 param.   Max number of swaps queued by the MP GL engine	*/
    kCGLCPGPURestartStatus = 317, /* 1 param.   Retrieves and clears the current CGLGPURestartStatus */
    kCGLCPAbortOnGPURestartStatusBlacklisted = 318, /* 1 param.  Establish action to take upon blacklisting */
    kCGLCPAbortOnGPURestartStatusDenied = 318, /* 1 param.  Establish action to take upon blacklisting */
    kCGLCPSupportGPURestart = 319, /* 1 param.   Does driver support auto-restart of GPU on hang/crash? */
    kCGLCPSupportSeparateAddressSpace = 320, /* 1 param. Does context get its own GPU address space?   */
    kCGLCPContextPriorityRequest = 608, /* 1 param. kCGLCPContextPriorityRequest[High|Normal|Low] 0|1|2 */



}

enum uint kCGLCPContextPriorityRequestHigh = 0,
    kCGLCPContextPriorityRequestNormal = 1,
    kCGLCPContextPriorityRequestLow = 2;

alias CGLGlobalOption = uint;
enum : CGLGlobalOption {
    kCGLGOFormatCacheSize = 501, /* Set the size of the pixel format cache        */
    kCGLGOClearFormatCache = 502, /* Reset the pixel format cache if true          */
    kCGLGORetainRenderers = 503, /* Whether to retain loaded renderers in memory  */
    kCGLGOUseBuildCache = 506, /* Enable the function compilation block cache. 
                                    Off by default.  Must be enabled at startup.  */
    kCGLGOResetLibrary = 504,
    kCGLGOUseErrorHandler = 505,
}

alias CGLOpenGLProfile = uint;
enum : CGLOpenGLProfile {
    kCGLOGLPVersion_Legacy = 0x1000, /* choose a renderer compatible with GL1.0       */
    kCGLOGLPVersion_3_2_Core = 0x3200, /* choose a renderer capable of GL3.2 or later   */
    kCGLOGLPVersion_GL3_Core = 0x3200, /* choose a renderer capable of GL3.2 or later   */
    kCGLOGLPVersion_GL4_Core = 0x4100, /* choose a renderer capable of GL4.1 or later   */
}

alias CGLError = uint;
enum : CGLError {
    kCGLNoError = 0, /* no error */
    kCGLBadAttribute = 10000, /* invalid pixel format attribute  */
    kCGLBadProperty = 10001, /* invalid renderer property       */
    kCGLBadPixelFormat = 10002, /* invalid pixel format            */
    kCGLBadRendererInfo = 10003, /* invalid renderer info           */
    kCGLBadContext = 10004, /* invalid context                 */
    kCGLBadDrawable = 10005, /* invalid drawable                */
    kCGLBadDisplay = 10006, /* invalid graphics device         */
    kCGLBadState = 10007, /* invalid context state           */
    kCGLBadValue = 10008, /* invalid numerical value         */
    kCGLBadMatch = 10009, /* invalid share context           */
    kCGLBadEnumeration = 10010, /* invalid enumerant               */
    kCGLBadOffScreen = 10011, /* invalid offscreen drawable      */
    kCGLBadFullScreen = 10012, /* invalid fullscreen drawable     */
    kCGLBadWindow = 10013, /* invalid window                  */
    kCGLBadAddress = 10014, /* invalid pointer                 */
    kCGLBadCodeModule = 10015, /* invalid code module             */
    kCGLBadAlloc = 10016, /* invalid memory allocation       */
    kCGLBadConnection = 10017 /* invalid CoreGraphics connection */
}

//
//			Buffer modes
//
enum kCGLMonoscopicBit = 0x00000001;
enum kCGLStereoscopicBit = 0x00000002;
enum kCGLSingleBufferBit = 0x00000004;
enum kCGLDoubleBufferBit = 0x00000008;
enum kCGLTripleBufferBit = 0x00000010;

//
//			Depth and stencil buffer depths
//
enum kCGL0Bit = 0x00000001;
enum kCGL1Bit = 0x00000002;
enum kCGL2Bit = 0x00000004;
enum kCGL3Bit = 0x00000008;
enum kCGL4Bit = 0x00000010;
enum kCGL5Bit = 0x00000020;
enum kCGL6Bit = 0x00000040;
enum kCGL8Bit = 0x00000080;
enum kCGL10Bit = 0x00000100;
enum kCGL12Bit = 0x00000200;
enum kCGL16Bit = 0x00000400;
enum kCGL24Bit = 0x00000800;
enum kCGL32Bit = 0x00001000;
enum kCGL48Bit = 0x00002000;
enum kCGL64Bit = 0x00004000;
enum kCGL96Bit = 0x00008000;
enum kCGL128Bit = 0x00010000;

// 
// Color and accumulation buffer formats.
// 
enum kCGLRGB444Bit = 0x00000040; /* 16 rgb bit/pixel,    R=11:8, G=7:4, B=3:0              */
enum kCGLARGB4444Bit = 0x00000080; /* 16 argb bit/pixel,   A=15:12, R=11:8, G=7:4, B=3:0     */
enum kCGLRGB444A8Bit = 0x00000100; /* 8-16 argb bit/pixel, A=7:0, R=11:8, G=7:4, B=3:0       */
enum kCGLRGB555Bit = 0x00000200; /* 16 rgb bit/pixel,    R=14:10, G=9:5, B=4:0             */
enum kCGLARGB1555Bit = 0x00000400; /* 16 argb bit/pixel,   A=15, R=14:10, G=9:5, B=4:0       */
enum kCGLRGB555A8Bit = 0x00000800; /* 8-16 argb bit/pixel, A=7:0, R=14:10, G=9:5, B=4:0      */
enum kCGLRGB565Bit = 0x00001000; /* 16 rgb bit/pixel,    R=15:11, G=10:5, B=4:0            */
enum kCGLRGB565A8Bit = 0x00002000; /* 8-16 argb bit/pixel, A=7:0, R=15:11, G=10:5, B=4:0     */
enum kCGLRGB888Bit = 0x00004000; /* 32 rgb bit/pixel,    R=23:16, G=15:8, B=7:0            */
enum kCGLARGB8888Bit = 0x00008000; /* 32 argb bit/pixel,   A=31:24, R=23:16, G=15:8, B=7:0   */
enum kCGLRGB888A8Bit = 0x00010000; /* 8-32 argb bit/pixel, A=7:0, R=23:16, G=15:8, B=7:0     */
enum kCGLRGB101010Bit = 0x00020000; /* 32 rgb bit/pixel,    R=29:20, G=19:10, B=9:0           */
enum kCGLARGB2101010Bit = 0x00040000; /* 32 argb bit/pixel,   A=31:30  R=29:20, G=19:10, B=9:0  */
enum kCGLRGB101010_A8Bit = 0x00080000; /* 8-32 argb bit/pixel, A=7:0  R=29:20, G=19:10, B=9:0    */
enum kCGLRGB121212Bit = 0x00100000; /* 48 rgb bit/pixel,    R=35:24, G=23:12, B=11:0          */
enum kCGLARGB12121212Bit = 0x00200000; /* 48 argb bit/pixel,   A=47:36, R=35:24, G=23:12, B=11:0 */
enum kCGLRGB161616Bit = 0x00400000; /* 64 rgb bit/pixel,    R=63:48, G=47:32, B=31:16         */
enum kCGLRGBA16161616Bit = 0x00800000; /* 64 argb bit/pixel,   R=63:48, G=47:32, B=31:16, A=15:0 */
enum kCGLRGBFloat64Bit = 0x01000000; /* 64 rgb bit/pixel,    half float                        */
enum kCGLRGBAFloat64Bit = 0x02000000; /* 64 argb bit/pixel,   half float                        */
enum kCGLRGBFloat128Bit = 0x04000000; /* 128 rgb bit/pixel,   ieee float                        */
enum kCGLRGBAFloat128Bit = 0x08000000; /* 128 argb bit/pixel,  ieee float                        */
enum kCGLRGBFloat256Bit = 0x10000000; /* 256 rgb bit/pixel,   ieee double                       */
enum kCGLRGBAFloat256Bit = 0x20000000; /* 256 argb bit/pixel,  ieee double                       */

//
//          Sampling modes
//
enum kCGLSupersampleBit = 0x00000001;
enum kCGLMultisampleBit = 0x00000002;
