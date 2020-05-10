//
//  SuffixArrayManipulatorImpl.swift
//  DataStructuresProfiling
//
//  Created by DK on 10.05.2020.
//  Copyright © 2020 DK. All rights reserved.
//

import Foundation

final class SuffixArrayManipulatorImpl: SuffixArrayManipulator {
    
    var joinedSuffixes: [(Substring, String)] = []
    
    func arrayHasObjects() -> Bool {
        
        joinedSuffixes.count != 0
    }
    
    func joinSuffixesWithNames() -> TimeInterval {
        
        Profiler.runClosureForTime() {
            
            let algoProvider = AlgoProvider()
            
            self.joinedSuffixes = zip(algoProvider.allSuffixSequences, algoProvider.all).map { sequencesWithNames in
                sequencesWithNames.0.map { ($0, sequencesWithNames.1) }
            }.flatMap{ $0 }
        }
    }
    
    func sortJoinedSuffixes() -> TimeInterval {
        
        Profiler.runClosureForTime() {
            
            self.joinedSuffixes = self.joinedSuffixes.sorted { $0.0 < $1.0 }
        }
    }
    
    func searchByRandomStrings() -> TimeInterval {
        
        Profiler.runClosureForTime() {
            
            let suffixesFound: Int = (1...10)
                .map { _ in StringGenerator().generateRandomString(3) }
                .flatMap { searchedString in self.joinedSuffixes.filter { $0.1.contains(searchedString) } }
                .count
            
            print("Suffxes found: \(suffixesFound)")
        }
    }
}
