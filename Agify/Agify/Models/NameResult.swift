//
//  nameResult.swift
//  Agify
//
//  Created by David Williams on 9/15/22.
//

import Foundation

struct NameResult: Codable, Identifiable, Hashable {
    
    var id = UUID()
    
    var name: String
    var age: Int?
    var count: Int
    var country_id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case age = "age"
        case count = "count"
        case country_id = "country_id"
    }
}
