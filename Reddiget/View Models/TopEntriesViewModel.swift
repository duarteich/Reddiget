//
//  TopEntriesViewModel.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 07/04/21.
//

import Foundation

public class TopEntriesViewModel {
    
    func fetchTopEntries(after: String? = nil) {
        RedditService.topEntries(after: after) { [weak self] (redditData, error) in
            guard
              let self = self,
              let redditData = redditData
            else {
              return
            }
        }
    }
}
