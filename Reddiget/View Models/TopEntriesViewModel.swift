//
//  TopEntriesViewModel.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 07/04/21.
//

import Foundation

public class TopEntriesViewModel {
    
    let entries = Box([Entry]())
    var after = ""
    let totalEntries = 50
    
    func fetchTopEntries() {
        RedditService.topEntries(after: after) { [weak self] (redditData, error) in
            guard
              let self = self,
              let redditData = redditData
            else {
              return
            }
            self.entries.value = redditData.data.children
            self.after = redditData.data.after ?? ""
        }
    }
}
