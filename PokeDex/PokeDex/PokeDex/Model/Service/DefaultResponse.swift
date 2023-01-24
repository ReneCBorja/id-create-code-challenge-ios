//
//  DefaultResponse.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import Foundation
struct DefaultResponse<T : Codable> : Codable{
    let responseT: T
   
}
