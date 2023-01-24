//
//  Ability.swift
//  PokeDex
//
//  Created by Rene Borja on 24/1/23.
//

import Foundation

struct Abilities: Codable{
    
    let ability:Ability
    
   
}


struct Ability: Codable{
    
    let name:String
    let url:String
   
}

struct AbilityList {
    var uniqueID : Int
    var name: String
}
