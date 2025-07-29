/**
    CGPath

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cgpath;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

/**
    An immutable path
*/
alias CGPathRef = CFTypeRef;

/**
    An mutable path
*/
alias CGMutablePathRef = CFTypeRef;

/**
    Styles for rendering the endpoint of a stroked line.
*/
enum CGLineCap : int {
    
    /**
        A line with a squared-off end.
        Core Graphics draws the line to extend only to the exact endpoint of the path.
        
        This is the default.
    */
    Butt,
    
    /**
        A line with a rounded end.
        Core Graphics draws the line to extend beyond the endpoint of the path.
        
        The line ends with a semicircular arc with a radius of 1/2 the line’s width, 
        centered on the endpoint.
    */
    Round,
    
    /**
        A line with a squared-off end. Core Graphics extends the line beyond the endpoint of the 
        path for a distance equal to half the line width.
    */
    Square
}

/**
    Junction types for stroked lines.
*/
enum CGLineJoin : int {
    
    /**
        A join with a sharp (angled) corner.
        
        Core Graphics draws the outer sides of the lines beyond the endpoint of the path, 
        until they meet. If the length of the miter divided by the line width is greater 
        than the miter limit, a bevel join is used instead.
        
        This is the default. To set the miter limit, see CGContextSetMiterLimit.
    */
    Miter,
    
    /**
        A join with a rounded end.
        Core Graphics draws the line to extend beyond the endpoint of the path.
        The line ends with a semicircular arc with a radius of 1/2 the line’s width, 
        centered on the endpoint.
    */
    Round,
    
    /**
        A join with a squared-off end.
        Core Graphics draws the line to extend beyond the endpoint of the path, 
        for a distance of 1/2 the line’s width.
    */
    Bevel
}

/**
    Options for rendering a path.
*/
enum CGPathDrawingMode : int {
    
    /**
        Render the area contained within the path using the non-zero winding number rule.
    */
    Fill,
    
    /**
        Render the area within the path using the even-odd rule.
    */
    EvenOdd,
    
    /**
        Render a line along the path. 
    */
    Stroke,
    
    /**
        First fill and then stroke the path, using the nonzero winding number rule.
    */
    FillStroke,
    
    /**
        First fill and then stroke the path, using the even-odd rule.
    */
    EvenOddFillStroke
}

/**
    The type of element found in a path.
*/
enum CGPathElementType : int {
    
    /**
        The path element that starts a new subpath. 
        The element holds a single point for the destination.
        See the function CGPathMoveToPoint.
    */
    MoveToPoint,
    
    /**
        The path element that adds a line from the current point to a new point.
        The element holds a single point for the destination.
        See the function CGPathAddLineToPoint.
    */
    AddLineToPoint,
    
    /**
        The path element that adds a quadratic curve from the current point to the specified point.
        The element holds a control point and a destination point.
        See the function CGPathAddQuadCurveToPoint.
    */
    AddQuadCurveToPoint,
    
    /**
        The path element that adds a cubic curve from the current point to the specified point. 
        The element holds two control points and a destination point.
        See the function CGPathAddCurveToPoint.
    */
    AddCurveToPoint,
    
    /**
        The path element that closes and completes a subpath.
        The element does not contain any points.
        See the function CGPathCloseSubpath.
    */
    CloseSubpth,
}

/**
    A data structure that provides information about a path element.
*/
struct CGPathElement {
    
    /**
        An array of one or more points that serve as arguments.
    */
    CGPoint* points;
    
    /**
        An element type (or operation).
    */
    CGPathElementType type;
}

/**
    Creates a mutable graphics path.
*/
extern CGMutablePathRef CGPathCreateMutable();