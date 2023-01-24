//
//  Protocols.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import Foundation
import Combine
import Alamofire

protocol PokemonServiceProtocol {
    func getPokemons() -> AnyPublisher<Pokemons,AFError>
}


protocol PokemonDetailServiceProtocol{
    func getDetailPokemon(name:String) -> AnyPublisher<PokemonDetail,AFError>

}
