//
//  PokemonService.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import Foundation
import Alamofire
import Combine


class PokemonService: PokemonServiceProtocol{
    
    
    func getPokemons() -> AnyPublisher<Pokemons,AFError>{
        return AF.request(Constants.baseUrl,method: .get)
            .validate()
            .publishDecodable(type:Pokemons.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}


class PokemonDetailService: PokemonDetailServiceProtocol{
    
    
    func getDetailPokemon(name:String) -> AnyPublisher<PokemonDetail,AFError>{
        return AF.request(Constants.baseUrl + "/\(name)",method: .get)
            .validate()
            .publishDecodable(type:PokemonDetail.self)
            .value()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
