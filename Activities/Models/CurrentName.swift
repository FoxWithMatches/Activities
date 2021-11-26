//
//  CurrentName.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

struct CurrentName {
    let personName: String
    var personNameCapitalized: String {
        personName.capitalized
    }
    
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
