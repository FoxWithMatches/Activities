//
//  CurrentNameData.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

import Foundation

struct CurrentNameData: Decodable {
    let name: String
    let gender: String
    
    var count: String {
        switch gender {
        case "male": return "pencil"
        case "female": return "scribble"
        default: return "nosign"
        }
    }
}
