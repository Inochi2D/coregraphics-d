/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGPath, CGMutablePath
*/
module coregraphics.cgcontext;
import coregraphics.cggeometry;
import coregraphics.cgcolor;
import coregraphics.cgfont;
import coregraphics.cgfunction;
import coregraphics.cgpath;
import coregraphics.cgpdf;
import coregraphics.cgshading;
import coregraphics.cgpattern;
import coregraphics.cggradient;
import coregraphics.cgimage;
import corefoundation.cfdictionary;
import corefoundation;

extern(C) @nogc nothrow:

/**
    Compositing operations for images.
*/
enum CGBlendMode {
    Normal,
    Multiply,
    Screen,
    Overlay,
    Darken,
    Lighten,
    ColorDodge,
    ColorBurn,
    SoftLight,
    HardLight,
    Difference,
    Exclusion,
    Hue,
    Saturation,
    Color,
    Luminosity,
    Clear,
    Copy,
    SourceIn,
    SourceOut,
    SourceAtop,
    DestinationOver,
    DestinationIn,
    DestinationOut,
    DestinationAtop,
    XOR,
    PlusDarker,
    PlusLighter
}

/**
    Levels of interpolation quality for rendering an image.
*/
enum CGInterpolationQuality {
    Default,
    None,
    Low,
    Medium,
    High
}

/**
    Modes for rendering text.
*/
enum CGTextDrawingMode {
    Fill,
    Stroke,
    FillStroke,
    Invisible,
    FillClip,
    StrokeClip,
    FillStrokeClip,
    Clip
}

/**
    A Quartz 2D drawing destination.
*/
alias CGContextRef = CFTypeRef;

/**
    Returns the type identifier for a graphics context.
*/
extern CFTypeID CGContextGetTypeID();

/**
    Forces all pending drawing operations in a window context to be rendered 
    immediately to the destination device.
*/
extern void CGContextFlush(CGContextRef c);

/**
    Decrements the retain count of a graphics context.
*/
extern void CGContextRelease(CGContextRef c);

/**
    Increments the retain count of a graphics context.
*/
extern CGContextRef CGContextRetain(CGContextRef c);

/**
    Marks a window context for update.
*/
extern void CGContextSynchronize(CGContextRef c);

/**
    Pushes a copy of the current graphics state onto the graphics state stack for the context.
*/
extern void CGContextSaveGState(CGContextRef c);

/**
    Sets the current graphics state to the state most recently saved.
*/
extern void CGContextRestoreGState(CGContextRef c);

/**
    Returns the current level of interpolation quality for a graphics context.
*/
extern CGInterpolationQuality CGContextGetInterpolationQuality(CGContextRef c);

/**
    Sets the accuracy of curved paths in a graphics context.
*/
extern void CGContextSetFlatness(CGContextRef c, CGFloat flatness);

/**
    Sets the level of interpolation quality for a graphics context.
*/
extern void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality);

/**
    Sets the style for the endpoints of lines drawn in a graphics context.
*/
extern void CGContextSetLineCap(CGContextRef c, CGLineCap cap);

/**
    Sets the pattern for dashed lines in a graphics context.
*/
extern void CGContextSetLineDash(CGContextRef c, CGFloat phase, const(CGFloat)* lengths, size_t count);

/**
    Sets the style for the joins of connected lines in a graphics context.
*/
extern void CGContextSetLineJoin(CGContextRef c, CGLineJoin join);

/**
    Sets the line width for a graphics context.
*/
extern void CGContextSetLineWidth(CGContextRef c, CGFloat width);

/**
    Sets the miter limit for the joins of connected lines in a graphics context.
*/
extern void CGContextSetMiterLimit(CGContextRef c, CGFloat limit);

/**
    Sets the pattern phase of a context.
*/
extern void CGContextSetPatternPhase(CGContextRef c, CGSize phase);

/**
    Sets the fill pattern in the specified graphics context.
*/
extern void CGContextSetFillPattern(CGContextRef c, CGPatternRef pattern, const(CGFloat)* components);

/**
    Sets the rendering intent in the current graphics state.
*/
extern void CGContextSetRenderingIntent(CGContextRef c, CGColorRenderingIntent intent);

/**
    Sets antialiasing on or off for a graphics context.
*/
extern void CGContextSetShouldAntialias(CGContextRef c, bool shouldAntialias);

/**
    Sets the stroke pattern in the specified graphics context.
*/
extern void CGContextSetStrokePattern(CGContextRef c, CGPatternRef pattern, const(CGFloat)* components);

/**
    Sets how sample values are composited by a graphics context.
*/
extern void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode);

/**
    Sets whether or not to allow antialiasing for a graphics context.
*/
extern void CGContextSetAllowsAntialiasing(CGContextRef c, bool allowsAntialiasing);

/**
    Sets whether or not to allow font smoothing for a graphics context.
*/
extern void CGContextSetAllowsFontSmoothing(CGContextRef c, bool allowsFontSmoothing);

/**
    Enables or disables font smoothing in a graphics context.
*/
extern void CGContextSetShouldSmoothFonts(CGContextRef c, bool shouldSmoothFonts);

/**
    Sets whether or not to allow subpixel positioning for a graphics context.
*/
extern void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, bool allowsFontSubpixelPositioning);

/**
    Enables or disables subpixel positioning in a graphics context.
*/
extern void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, bool shouldSubpixelPositionFonts);

/**
    Sets whether or not to allow subpixel quantization for a graphics context.
*/
extern void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, bool allowsFontSubpixelQuantization);

/**
    Enables or disables subpixel quantization in a graphics context.
*/
extern void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, bool shouldSubpixelQuantizeFonts);

/**
    Adds an arc of a circle to the current path, possibly preceded by a straight line segment.
*/
extern void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise);

/**
    Adds an arc of a circle to the current path, using a radius and tangent points.
*/
extern void CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius);

/**
    Appends a cubic Bézier curve from the current point, using the provided control points and end point .
*/
extern void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y);

/**
    Adds a sequence of connected straight-line segments to the current path.
*/
extern void CGContextAddLines(CGContextRef c, const CGPoint *points, size_t count);

/**
    Appends a straight line segment from the current point to the provided point .
*/
extern void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y);

/**
    Adds a previously created path object to the current path in a graphics context.
*/
extern void CGContextAddPath(CGContextRef c, CGPathRef path);

/**
    Returns a path object built from the current path information in a graphics context.
*/
extern CGPathRef CGContextCopyPath(CGContextRef c);

/**
    Appends a quadratic Bézier curve from the current point, using a control point and an end point you specify.
*/
extern void CGContextAddQuadCurveToPoint(CGContextRef c, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y);

/**
    Adds a rectangular path to the current path.
*/
extern void CGContextAddRect(CGContextRef c, CGRect rect);

/**
    Adds a set of rectangular paths to the current path.
*/
extern void CGContextAddRects(CGContextRef c, const CGRect *rects, size_t count);

/**
    Creates a new empty path in a graphics context.
*/
extern void CGContextBeginPath(CGContextRef c);

/**
    Closes and terminates the current path’s subpath.
*/
extern void CGContextClosePath(CGContextRef c);

/**
    Begins a new subpath at the point you specify.
*/
extern void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y);

/**
    Adds an ellipse that fits inside the specified rectangle.
*/
extern void CGContextAddEllipseInRect(CGContextRef c, CGRect rect);

/**
    Paints a transparent rectangle.
*/
extern void CGContextClearRect(CGContextRef c, CGRect rect);

/**
    Draws the current path using the provided drawing mode.
*/
extern void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode);

/**
    Paints the area within the current path, using the even-odd fill rule.
*/
extern void CGContextEOFillPath(CGContextRef c);

/**
    Paints the area within the current path, using the nonzero winding number rule.
*/
extern void CGContextFillPath(CGContextRef c);

/**
    Paints the area contained within the provided rectangle, using the fill color in the current graphics state.
*/
extern void CGContextFillRect(CGContextRef c, CGRect rect);

/**
    Paints the areas contained within the provided rectangles, using the fill color in the current graphics state.
*/
extern void CGContextFillRects(CGContextRef c, const CGRect *rects, size_t count);

/**
    Paints the area of the ellipse that fits inside the provided rectangle, using the fill color in the current graphics state.
*/
extern void CGContextFillEllipseInRect(CGContextRef c, CGRect rect);

/**
    Paints a line along the current path.
*/
extern void CGContextStrokePath(CGContextRef c);

/**
    Paints a rectangular path.
*/
extern void CGContextStrokeRect(CGContextRef c, CGRect rect);

/**
    Paints a rectangular path, using the specified line width.
*/
extern void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width);

/**
    Replaces the path in the graphics context with the stroked version of the path.
*/
extern void CGContextReplacePathWithStrokedPath(CGContextRef c);

/**
    Strokes an ellipse that fits inside the specified rectangle.
*/
extern void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect);

/**
    Strokes a sequence of line segments.
*/
extern void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count);

/**
    Indicates whether the current path contains any subpaths.
*/
extern bool CGContextIsPathEmpty(CGContextRef c);

/**
    Returns the current point in a non-empty path.
*/
extern CGPoint CGContextGetPathCurrentPoint(CGContextRef c);

/**
    Returns the smallest rectangle that contains the current path.
*/
extern CGRect CGContextGetPathBoundingBox(CGContextRef c);

/**
    Checks to see whether the specified point is contained in the current path.
*/
extern bool CGContextPathContainsPoint(CGContextRef c, CGPoint point, CGPathDrawingMode mode);

/**
    Modifies the current clipping path, using the nonzero winding number rule.
*/
extern void CGContextClip(CGContextRef c);

/**
    Modifies the current clipping path, using the even-odd rule.
*/
extern void CGContextEOClip(CGContextRef c);

/**
    Sets the clipping path to the intersection of the current clipping path 
    with the area defined by the specified rectangle.
*/
extern void CGContextClipToRect(CGContextRef c, CGRect rect);

/**
    Sets the clipping path to the intersection of the current clipping path 
    with the region defined by an array of rectangles.
*/
extern void CGContextClipToRects(CGContextRef c, const CGRect *rects, size_t count);

/**
    Returns the bounding box of a clipping path.
*/
extern CGRect CGContextGetClipBoundingBox(CGContextRef c);

/**
    Maps a mask into the specified rectangle and intersects it with the 
    current clipping area of the graphics context.
*/
extern void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask);

/**
    Sets the opacity level for objects drawn in a graphics context.
*/
extern void CGContextSetAlpha(CGContextRef c, CGFloat alpha);

/**
    Sets the current fill color to a value in the DeviceCMYK color space.
*/
extern void CGContextSetCMYKFillColor(CGContextRef c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha);

/**
    Sets the current fill color.
*/
extern void CGContextSetFillColor(CGContextRef c, const(CGFloat)* components);

/**
    Sets the current stroke color to a value in the DeviceCMYK color space.
*/
extern void CGContextSetCMYKStrokeColor(CGContextRef c, CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha);

/**
    Sets the fill color space in a graphics context.
*/
extern void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space);

/**
    Sets the current fill color in a graphics context, using a CGColor.
*/
extern void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color);

/**
    Sets the current fill color to a value in the DeviceGray color space.
*/
extern void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha);

/**
    Sets the current stroke color to a value in the DeviceGray color space.
*/
extern void CGContextSetGrayStrokeColor(CGContextRef c, CGFloat gray, CGFloat alpha);

/**
    Sets the current fill color to a value in the DeviceRGB color space.
*/
extern void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
    Sets the current stroke color to a value in the DeviceRGB color space.
*/
extern void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha);

/**
    Enables shadowing in a graphics context.
*/
extern void CGContextSetShadow(CGContextRef c, CGSize offset, CGFloat blur);

/**
    Enables shadowing with color a graphics context.
*/
extern void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color);

/**
    Sets the current stroke color.
*/
extern void CGContextSetStrokeColor(CGContextRef c, const(CGFloat)* components);

/**
    Sets the stroke color space in a graphics context.
*/
extern void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space);

/**
    Sets the current stroke color in a context, using a CGColor.
*/
extern void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color);

/**
    Transforms the user coordinate system in a context using a specified matrix.
*/
extern void CGContextConcatCTM(CGContextRef c, CGAffineTransform transform);

/**
    Returns the current transformation matrix.
*/
extern CGAffineTransform CGContextGetCTM(CGContextRef c);

/**
    Rotates the user coordinate system in a context.
*/
extern void CGContextRotateCTM(CGContextRef c, CGFloat angle);

/**
    Changes the scale of the user coordinate system in a context.
*/
extern void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy);

/**
    Changes the origin of the user coordinate system in a context.
*/
extern void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty);

/**
    Begins a transparency layer.
*/
extern void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo);

/**
    Begins a transparency layer whose contents are bounded by the specified rectangle.
*/
extern void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo);

/**
    Ends a transparency layer.
*/
extern void CGContextEndTransparencyLayer(CGContextRef c);

/**
    Repeatedly draws an image, scaled to the provided rectangle, to fill the current clip region. 
*/
extern void CGContextDrawTiledImage(CGContextRef c, CGRect rect, CGImageRef image);

/**
    Draws an image into a graphics context.
*/
extern void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image);

/**
    Draws the content of a PDF page into the current graphics context.
*/
extern void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page);

/**
    Paints a gradient fill that varies along the line defined by the provided starting and ending points.
*/
extern void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options);

/**
    Paints a gradient fill that varies along the area defined by the provided starting and ending circles.
*/
extern void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options);

/**
    ills the clipping path of a context with the specified shading.
*/
extern void CGContextDrawShading(CGContextRef c, CGShadingRef shading);

/**
    Starts a new page in a page-based graphics context.
*/
extern void CGContextBeginPage(CGContextRef c, const CGRect *mediaBox);

/**
    Ends the current page in a page-based graphics context.
*/
extern void CGContextEndPage(CGContextRef c);

/**
    Draws glyphs at the provided position.
*/
extern void CGContextShowGlyphsAtPositions(CGContextRef c, const CGGlyph *glyphs, const CGPoint *Lpositions, size_t count);

/**
    Returns the current text matrix.
*/
extern CGAffineTransform CGContextGetTextMatrix(CGContextRef c);

/**
    Returns the location at which text is drawn.
*/
extern CGPoint CGContextGetTextPosition(CGContextRef c);

/**
    Sets the current character spacing.
*/
extern void CGContextSetCharacterSpacing(CGContextRef c, CGFloat spacing);

/**
    Sets the platform font in a graphics context.
*/
extern void CGContextSetFont(CGContextRef c, CGFontRef font);

/**
    Sets the current font size.
*/
extern void CGContextSetFontSize(CGContextRef c, CGFloat size);

/**
    Sets the current text drawing mode.
*/
extern void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode);

/**
    Sets the current text matrix.
*/
extern void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform t);

/**
    Sets the location at which text is drawn.
*/
extern void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y);

/**
    Returns an affine transform that maps user space coordinates to device space coordinates.
*/
extern CGAffineTransform CGContextGetUserSpaceToDeviceSpaceTransform(CGContextRef c);

/**
    Returns a point that is transformed from user space coordinates to device space coordinates.
*/
extern CGPoint CGContextConvertPointToDeviceSpace(CGContextRef c, CGPoint point);

/**
    Returns a point that is transformed from device space coordinates to user space coordinates.
*/
extern CGPoint CGContextConvertPointToUserSpace(CGContextRef c, CGPoint point);

/**
    Returns a size that is transformed from user space coordinates to device space coordinates.
*/
extern CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size);

/**
    Returns a size that is transformed from device space coordinates to user space coordinates.
*/
extern CGSize CGContextConvertSizeToUserSpace(CGContextRef c, CGSize size);

/**
    Returns a rectangle that is transformed from user space coordinate to device space coordinates.
*/
extern CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect);

/**
    Returns a rectangle that is transformed from user space coordinate to device space coordinates.
*/
extern CGRect CGContextConvertRectToUserSpace(CGContextRef c, CGRect rect);
