//
//  CurrentName.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

import Foundation

struct CurrentName {
    let personName: String
    let personGender: String
    
    var count: String {
        switch personGender {
        case "male": return "male"
        case "female": return "female"
        default: return "nosign"
        }
    }
    
    init?(currentNameData: CurrentNameData) {
        personName = currentNameData.name
        personGender = currentNameData.gender
    }
}
