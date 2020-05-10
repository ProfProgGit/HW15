//
//  SuffixSequence.swift
//  DataStructuresProfiling
//
//  Created by Dk on 10.05.2020.
//  Copyright © 2020 DK. All rights reserved.
//

struct SuffixIterator: IteratorProtocol {
    
    let originalString: String
    var suffixStartIndex: String.Index
    
    init(from original: String) {
        
        originalString = original
        suffixStartIndex = original.endIndex
    }
    
    mutating func next() -> Substring? {
        
        guard suffixStartIndex > originalString.startIndex else { return nil }
        suffixStartIndex = originalString.index(before: suffixStartIndex)
        return originalString[suffixStartIndex...]
    }
}

struct SuffixSequence: Sequence {
    
    let string: String
    
    init(_ initValue: String) {
        
        string = initValue
    }
    
    func makeIterator() -> SuffixIterator {
        SuffixIterator(from: string)
    }
}
