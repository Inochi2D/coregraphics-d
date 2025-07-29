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

alias CGPDFArrayRef              = CFSubType!("CGPDFArray");
alias CGPDFContentStreamRef      = CFSubType!("CGPDFContentStream");
alias CGPDFContextRef            = CFSubType!("CGPDFContext");
alias CGPDFDictionaryRef         = CFSubType!("CGPDFDictionary");
alias CGPDFObjectRef             = CFSubType!("CGPDFObject");
alias CGPDFOperatorTableRef      = CFSubType!("CGPDFOperatorTable");
alias CGPDFPageRef               = CFSubType!("CGPDFPage");
alias CGPDFScannerRef            = CFSubType!("CGPDFScanner");
alias CGPDFStreamRef             = CFSubType!("CGPDFStream");
alias CGPDFStringRef             = CFSubType!("CGPDFString");
alias CGPSConverterRef           = CFSubType!("CGPSConverter");