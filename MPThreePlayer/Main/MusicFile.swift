//
//  MusicFile.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/07.
//

import Foundation

struct MusicFile {
    
    var fileIndex: Int
    var subject: String
    
    var url: URL? {
        Bundle.main.url(forResource: "file\(fileIndex)",
                        withExtension: "mp3")
    }
}
