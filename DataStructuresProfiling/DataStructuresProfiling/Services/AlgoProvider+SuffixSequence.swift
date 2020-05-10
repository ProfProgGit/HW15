//
//  AlgoProvider+SuffixSequence.swift
//  DataStructuresProfiling
//
//  Created by DK on 10.05.2020.
//  Copyright © 2020 DK. All rights reserved.
//

extension AlgoProvider {
    
    var allSuffixSequences: [SuffixSequence] {
        
        all.map { SuffixSequence($0) }
    }
}
