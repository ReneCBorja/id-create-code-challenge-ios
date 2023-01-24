//
//  Stat.swift
//  PokeDex
//
//  Created by Rene Borja on 24/1/23.
//

import Foundation

struct Stats: Codable{
    let base_stat: String
    let stat:Stat
    
   
}

struct Stat: Codable{
    let name:String
    
   
}


struct StatList {
    var uniqueID : Int
    var name: String
}
