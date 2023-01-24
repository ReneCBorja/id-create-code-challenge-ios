//
//  vmPokemonDetail.swift
//  PokeDex
//
//  Created by Rene Borja on 24/1/23.
//

import Foundation
import Alamofire
import UIKit
import SwiftUI
class vmPokemonDetail: BaseViewModel{
    let pokemonDetailService: PokemonDetailService = PokemonDetailService()
    
    @Published var showSuccess = false
    @Published var showError = false
    @Published var message = ""
    @Published var pokeName = ""
    @Published var pokemonDetailList: [PokemonDetail] = []
    @Published var abilityList: [AbilityList] = []
    @Published var moveList: [MoveList] = []
    @Published var statsList: [StatList] = []
    @Published var pokeImage = "pokeball"

    func getDetailPokemons(pokeName:String){
        self.showLoading.toggle()
        pokemonDetailService.getDetailPokemon(name: pokeName)
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
            }receiveValue: {  response in
                //                for (index, hab)in response.moves.enumerated(){
                //                 //   self.abilityList.append(AbilityList(uniqueID: index, name: hab.name))
            //}
                self.getPokeImage(urlImage: response.sprites.front_default)
                self.showLoading.toggle()

            }
            .store(in: &cancellableSet)
    }
    
    func getPokeImage(urlImage:String) {
        
            let destination: DownloadRequest.Destination = { _, _  in
                       let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                       let fileURL = documentsURL.appendingPathComponent("pokeImagep.png")

                       return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                   }
            
            
            AF.download(urlImage, to: destination).response { response in
                        switch response.result{
                        case .success( let result):
                            let urlPath = String(describing: response.result).replacingOccurrences(of: "success(Optional(file:", with: "")
                                //                            print("URL Stamp::",urlPath.replacingOccurrences(of: ")", with: ""))
                                
                                self.pokeImage = urlPath
                            
                        case .failure(let error):
                            print("ERROR:: DESCARGA ", error)

                        }
                    }
        }
        
    }
    
    

