//
//  SuffixArrayViewController.swift
//  DataStructuresProfiling
//
//  Created by DK on 10.05.2020.
//  Copyright © 2020 DK. All rights reserved.
//

private enum SuffixArrayVCRow: Int {
    
    case joinSuffixes = 0, sortSuffixes, searchSuffixes
}

import UIKit

class SuffixArrayViewController: DataStructuresViewController {
    
    let suffixArrayManipulator: SuffixArrayManipulator = SuffixArrayManipulatorImpl()
    
    var joinSuffixesTime: TimeInterval = 0
    var sortSuffixesTime: TimeInterval = 0
    var searchSuffixesTime: TimeInterval = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        createAndTestButton.setTitle("Create Suffix Array and Test", for: [])
    }
    
    override func create(_ size: Int) {
        
        joinSuffixesTime = suffixArrayManipulator.joinSuffixesWithNames()
    }
    
    override func test() {
        
        if (suffixArrayManipulator.arrayHasObjects()) {
            sortSuffixesTime = suffixArrayManipulator.sortJoinedSuffixes()
            searchSuffixesTime = suffixArrayManipulator.searchByRandomStrings()
        } else {
            print("Array not set up yet!")
        }
    }
    
    //MARK: Table View Override
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        switch (indexPath as NSIndexPath).row {
            
        case SuffixArrayVCRow.joinSuffixes.rawValue:
            cell.textLabel!.text = "Suffix Array Creation:"
            cell.detailTextLabel!.text = formattedTime(joinSuffixesTime)
            
        case SuffixArrayVCRow.sortSuffixes.rawValue:
            cell.textLabel!.text = "Sort Suffix Array:"
            cell.detailTextLabel!.text = formattedTime(sortSuffixesTime)
            
        case SuffixArrayVCRow.searchSuffixes.rawValue:
            cell.textLabel!.text = "Search Suffix Array:"
            cell.detailTextLabel!.text = formattedTime(searchSuffixesTime)
            
        default:
            cell.textLabel!.text = ""
            cell.detailTextLabel!.text = ""
        }
        
        return cell
    }
}
