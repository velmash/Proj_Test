//
//  CharacterInfo.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/14.
//

import Foundation

struct CharacterInfo: Codable {
    let ServerName: String
    let CharacterName: String
    let CharacterLevel: Int32
    let CharacterClassName: String
    let ItemAvgLevel: String
    let ItemMaxLevel: String
}
