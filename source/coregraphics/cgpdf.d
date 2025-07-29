/**
    CGPDF

    Copyright: Copyright © 2025, Kitsunebi Games EMV
    License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
    Authors:   Luna Nielsen
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