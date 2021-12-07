//
//  ListeningFilesRepository.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/07.
//

import Foundation
import AVFoundation

class ListeningFilesRepository {
    
    let subjects: [String] = [
        "Have1", "Have2", "Make1", "Make2", "Take1", "Take2", "Get1", "Get2",
        "Give1", "Give2", "Keep1", "Keep2", "Put1", "Put2",
        "통합1",
        "In/On/At(장소)1", "In/On/At(장소)2", "In/On/At(시간)1", "In/On/At(시간)2",
        "In/On/At(기타)1", "In/On/At(기타)2",
        "Up1", "Up2", "Down1", "Down2", "Off1", "Off2",
        "Out1", "Out2", "For1", "For2", "With1", "With2",
        "실전2",
    ]
    
    var musicModels: [MusicFile] {
        return subjects
            .enumerated()
            .map { index, subject in
                MusicFile(fileIndex: index, subject: subject)
            }
    }
}
