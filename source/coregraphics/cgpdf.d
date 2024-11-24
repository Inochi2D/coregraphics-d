/*
    Copyright © 2024, Inochi2D Project
    Distributed under the 2-Clause BSD License, see LICENSE file.
    
    Authors: Luna Nielsen
*/

/**
    CGPDF
*/
module coregraphics.cgpdf;
import coregraphics.cggeometry;
import corefoundation;

extern(C) @nogc nothrow:

alias CGPDFArrayRef              = CFTypeRef;
alias CGPDFContentStreamRef      = CFTypeRef;
alias CGPDFContextRef            = CFTypeRef;
alias CGPDFDictionaryRef         = CFTypeRef;
alias CGPDFObjectRef             = CFTypeRef;
alias CGPDFOperatorTableRef      = CFTypeRef;
alias CGPDFPageRef               = CFTypeRef;
alias CGPDFScannerRef            = CFTypeRef;
alias CGPDFStreamRef             = CFTypeRef;
alias CGPDFStringRef             = CFTypeRef;
alias CGPSConverterRef           = CFTypeRef;