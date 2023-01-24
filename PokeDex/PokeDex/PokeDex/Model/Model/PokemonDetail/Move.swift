//
//  Move.swift
//  PokeDex
//
//  Created by Rene Borja on 24/1/23.
//

import Foundation
struct Moves: Codable{
    
    let moves:Move
    
   
}

struct Move: Codable{
    
    let name:String
    
   
}
struct MoveList {
    var uniqueID : Int
    var name: String
}
