//
//  GuildsRanking.swift
//  PocketLoa
//
//  Created by 윤형찬 on 2022/12/14.
//

import Foundation

struct GuildsRanking: Codable {
    let Rank: Int32
    let GuildName: String
    let GuildMessage: String
    let MasterName: String
    let Rating: Int32
    let MemberCount: Int32
    let MaxMemberCount: Int32
    let UpdatedDate: String
}
