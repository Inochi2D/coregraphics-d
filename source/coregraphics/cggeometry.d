/**
    CGGeometry
    
    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
*/
module coregraphics.cggeometry;
import core.stdc.math : cos, sin;


/**
    The basic type for all floating-point values.
*/
alias CGFloat = double;

/**
    A structure that contains a point in a two-dimensional coordinate system.
*/
struct CGPoint {
    
    /**
        The x-coordinate of the point.
    */
    CGFloat x;
    
    /**
        The y-coordinate of the point.
    */
    CGFloat y;

    /**
        Returns whether two points are equal.
    */
    bool opEquals(CGPoint other) const {
        return 
            this.x == other.x && 
            this.y == other.y;
    }
}

/**
    A structure that contains a two-dimensional vector.
*/
struct CGVector {
    
    /**
        The x-coordinate of the point.
    */
    CGFloat dx;
    
    /**
        The y-coordinate of the point.
    */
    CGFloat dy;

    /**
        Returns whether two vectors are equal.
    */
    bool opEquals(CGVector other) const {
        return 
            this.dx == other.dx && 
            this.dy == other.dy;
    }
}

/**
    A structure that contains a point in a two-dimensional coordinate system.
*/
struct CGSize {
    
    /**
        A width value.
    */
    CGFloat width;
    
    /**
        A height value.
    */
    CGFloat height;

    /**
        Returns whether two sizes are equal.
    */
    bool opEquals(CGSize other) const {
        return 
            this.width == other.width && 
            this.height == other.height;
    }
}

/**
    A structure that contains the location and dimensions of a rectangle.
*/
struct CGRect {
    
    /**
        A point that specifies the coordinates of the rectangle’s origin.
    */
    CGPoint origin;
    
    /**
        A size that specifies the height and width of the rectangle.
    */
    CGSize size;
}

/**
    An affine transformation matrix for use in drawing 2D graphics.
*/
struct CGAffineTransform {
    
    /**
        The entry at position [1,1] in the matrix.
    */
    CGFloat a;
    
    /**
        The entry at position [1,2] in the matrix.
    */
    CGFloat b;
    
    /**
        The entry at position [2,1] in the matrix.
    */
    CGFloat c;
    
    /**
        The entry at position [2,2] in the matrix.
    */
    CGFloat d;
    
    /**
        The entry at position [3,1] in the matrix.
    */
    CGFloat tx;
    
    /**
        The entry at position [3,2] in the matrix.
    */
    CGFloat ty;

    /**
        Creates an identity matrix.
    */
    static CGAffineTransform identity() {
        return CGAffineTransform(
             a: 1,  b: 0,
             c: 0,  d: 1,
            tx: 0, ty: 0
        );
    }

    /**
        Creates an scaling matrix.
    */
    static CGAffineTransform scaling(CGFloat sx, CGFloat sy) {
        return CGAffineTransform(
             a: sx,  b: 0,
             c: 0,   d: sy,
            tx: 0,  ty: 0
        );
    }

    /**
        Creates an rotation matrix.
    */
    static CGAffineTransform rotation(CGFloat angle) {
        return CGAffineTransform(
             a:  cos(angle),  b: sin(angle),
             c: -sin(angle),  d: cos(angle),
            tx: 0,           ty: 0
        );
    }

    /**
        Creates an scaling matrix.
    */
    static CGAffineTransform translation(CGFloat x, CGFloat y) {
        return CGAffineTransform(
             a: 1,  b: 0,
             c: 0,  d: 1,
            tx: x, ty: y
        );
    }

    /**
        Applies this affine transform to the specified CGPoint instance,
        and returns a new CGPoint with the transformed point.
    */
    CGPoint apply(CGPoint point) {
        CGPoint p;
        p.x  = cast(CGFloat)(cast(double)this.a * point.x + cast(double)this.c * point.y + this.tx);
        p.y  = cast(CGFloat)(cast(double)this.b * point.x + cast(double)this.d * point.y + this.ty);
        return p;
    }

    /**
        Applies this affine transform to the specified CGSize instance,
        and returns a new CGSize with the transformed size.
    */
    CGSize apply(CGSize size) {
        CGSize s;
        s.width  = cast(CGFloat)(cast(double)this.a * size.width + cast(double)this.c * size.height);
        s.height = cast(CGFloat)(cast(double)this.b * size.width + cast(double)this.d * size.height);
        return s;
    }
}