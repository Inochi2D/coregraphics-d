/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGFont
*/
module coregraphics.cgfont;
import coregraphics.cggeometry;
import coregraphics.cgdata;
import corefoundation;
import corefoundation.cfdictionary;
import corefoundation.cfdata;
import corefoundation.cfarray;
import corefoundation.cfstring;

extern(C) @nogc nothrow:

/**
    Possible formats for a PostScript font subset.
*/
enum CGFontPostScriptFormat : int {
    
    /**
        This is documented in Adobe Type 1 Font Format, which is available from http://partners.adobe.com/.
    */
    Type1,
    
    /**
        This is documented in PostScript Language Reference, 3rd edition, 
        which is available from http://partners.adobe.com/.
    */
    Type3,
    
    /**
        This is documented in Adobe Technical Note 5012, The Type 42 Font Format Specification, 
        which is available from http://partners.adobe.com/.
    */
    Type42
}

/**
    A set of character glyphs and layout information for drawing text.
*/
alias CGFontRef = CFTypeRef;

/**
    An index into a font table.
*/
alias CGFontIndex = ushort;

/**
    An index into the internal glyph table of a font.
*/
alias CGGlyph = CGFontIndex;

/**
    Returns the Core Foundation type identifier for Core Graphics fonts.
*/
extern CFTypeID CGFontGetTypeID();

/**
    Increments the retain count of a font.
*/
extern CGFontRef CGFontRetain(CGFontRef font);

/**
    Decrements the retain count of a font.
*/
extern void CGFontRelease(CGFontRef font);

/**
    Creates a font object from data supplied from a data provider.
*/
extern CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider);

/**
    Creates a font object corresponding to the font specified by a PostScript or full name.
*/
extern CGFontRef CGFontCreateWithFontName(CFStringRef name);

/**
    Creates a copy of a font using a variation specification dictionary.
*/
extern CGFontRef CGFontCreateCopyWithVariations(CGFontRef font, CFDictionaryRef variations);

/**
    Obtains the PostScript name of a font.
*/
extern CFStringRef CGFontCopyPostScriptName(CGFontRef font);

/**
    Determines whether Core Graphics can create a subset of the font in PostScript format.
*/
extern bool CGFontCanCreatePostScriptSubset(CGFontRef font, CGFontPostScriptFormat format);

/**
    Creates a subset of the font in the specified PostScript format.
*/
extern CFDataRef CGFontCreatePostScriptSubset(CGFontRef font, CFStringRef subsetName, CGFontPostScriptFormat format, const CGGlyph *glyphs, size_t count, const CGGlyph *encoding);

/**
    Creates a PostScript encoding of a font.
*/
extern CFDataRef CGFontCreatePostScriptEncoding(CGFontRef font, const CGGlyph *encoding);

/**
    Returns an array of tags that correspond to the font tables for a font.
*/
extern CFArrayRef CGFontCopyTableTags(CGFontRef font);

/**
    Returns the font table that corresponds to the provided tag.
*/
extern CFDataRef CGFontCopyTableForTag(CGFontRef font, uint tag);

/**
    Returns an array of the variation axis dictionaries for a font.
*/
extern CFArrayRef CGFontCopyVariationAxes(CGFontRef font);

/**
    Returns the variation specification dictionary for a font.
*/
extern CFDictionaryRef CGFontCopyVariations(CGFontRef font);

/**
    Returns the full name associated with a font object.
*/
extern CFStringRef CGFontCopyFullName(CGFontRef font);

/**
    Returns the ascent of a font.
*/
extern int CGFontGetAscent(CGFontRef font);

/**
    Returns the descent of a font.
*/
extern int CGFontGetDescent(CGFontRef font);

/**
    Returns the leading of a font.
*/
extern int CGFontGetLeading(CGFontRef font);

/**
    Returns the cap height of a font.
*/
extern int CGFontGetCapHeight(CGFontRef font);

/**
    Returns the x-height of a font.
*/
extern int CGFontGetXHeight(CGFontRef font);

/**
    Returns the bounding box of a font.
*/
extern CGRect CGFontGetFontBBox(CGFontRef font);

/**
    Returns the italic angle of a font.
*/
extern CGFloat CGFontGetItalicAngle(CGFontRef font);

/**
    Returns the thickness of the dominant vertical stems of glyphs in a font.
*/
extern CGFloat CGFontGetStemV(CGFontRef font);

/**
    Get the bounding box of each glyph in an array.
*/
extern bool CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes);

/**
    Returns the glyph for the glyph name associated with the specified font object.
*/
extern CGGlyph CGFontGetGlyphWithGlyphName(CGFontRef font, CFStringRef name);

/**
    Returns the glyph name of the specified glyph in the specified font.
*/
extern CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph); 

/**
    Returns the number of glyphs in a font.
*/
extern size_t CGFontGetNumberOfGlyphs(CGFontRef font);

/**
    Gets the advance width of each glyph in the provided array.
*/
extern bool CGFontGetGlyphAdvances(CGFontRef font, const CGGlyph *glyphs, size_t count, int *advances);

/**
    Returns the number of glyph space units per em for the provided font.
*/
extern int CGFontGetUnitsPerEm(CGFontRef font);