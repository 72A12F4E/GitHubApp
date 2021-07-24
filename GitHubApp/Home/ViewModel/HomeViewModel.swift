//
//  HomeViewModel.swift
//  GitHubApp
//
//  Created by Blake McAnally on 7/24/21.
//

import Foundation

class HomeViewModel {
    struct Section: Identifiable, Hashable {
        let id: UUID
        let title: String
        let rows: [Row]
    }
    
    struct Row: Identifiable, Hashable {
        let id: UUID
        let icon: String
        let title: String
    }
    
    var sections: [Section] = [
        Section(id: UUID(), title: "My Work", rows: [
            Row(id: UUID(), icon: "dot.radiowaves.left.and.right", title: "Issues"),
            Row(id: UUID(), icon: "arrow.triangle.merge", title: "Pull Requests"),
            Row(id: UUID(), icon: "bubble.left.and.bubble.right", title: "Discussions"),
            Row(id: UUID(), icon: "book.closed", title: "Repositories"),
            Row(id: UUID(), icon: "building.2", title: "Organizations"),
        ]),
        Section(id: UUID(), title: "Favorites", rows: [
        
        ]),
        Section(id: UUID(), title: "Recent", rows: [
        
        ]),
    ]
}
