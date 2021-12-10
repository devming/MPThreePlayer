//
//  MusicFile.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/07.
//

import Foundation

enum MainSection: Hashable {
    case main
}

struct MusicFile: Hashable {
    
    var fileIndex: Int
    var subject: String
    
    var url: URL? {
        Bundle.main.url(forResource: "file\(fileIndex)",
                        withExtension: "mp3")
    }
}
