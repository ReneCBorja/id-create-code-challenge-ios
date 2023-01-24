//
//  vmContentView.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import Foundation
import SwiftUI

class vmContentView: BaseViewModel{
    
    let pokemonService: PokemonService = PokemonService()
    let pokemonDetailService: PokemonDetailService = PokemonDetailService()
    
    @Published var showSuccess = false
    @Published var showError = false
    @Published var message = ""
    @Published var pokemonList: [PokemonList] = []
    
    func getPokemons(){
        self.showLoading.toggle()
        pokemonService.getPokemons()
            .sink{ completion in
                switch completion {
                case .finished:
                    print("finished", completion)
                    break
                case .failure(let error):
                    print("error inesperado \(error):::\(completion)")
                    self.message = "Algo ha salido mal... intente de nuevo mas tarde."
                    self.showError.toggle()
                    break
                }
                self.showLoading.toggle()
            }receiveValue: { response in
                for (index, poke)in response.results.enumerated(){
                    self.pokemonList.append(PokemonList(uniqueID: index, name: poke.name, url: poke.url))
                }
                self.showLoading.toggle()
                
            }
            .store(in: &cancellableSet)
    }
    
    
}
