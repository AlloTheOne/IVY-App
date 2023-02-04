//
//  TweetFilterViewModel.swift
//  Ivy
//
//  Created by Sara Khalid BIN kuddah on 24/05/1444 AH.
//

import Foundation

enum ProgressFilterViewModel: Int, CaseIterable{
    case points
    case badges
    
    var title: String{
        switch self {
        case .points: return "Points"
        case .badges: return "Badges"
        }
    }
}
