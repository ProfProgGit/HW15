//
//  SuffixArrayManipulator.swift
//  DataStructuresProfiling
//
//  Created by DK on 10.05.2020.
//  Copyright © 2020 DK. All rights reserved.
//

import Foundation

protocol SuffixArrayManipulator {
    
  func arrayHasObjects() -> Bool
  func joinSuffixesWithNames() -> TimeInterval
  func sortJoinedSuffixes() -> TimeInterval
  func searchByRandomStrings() -> TimeInterval
}

