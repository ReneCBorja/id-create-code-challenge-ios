//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Rene Borja on 24/1/23.
//

import SwiftUI

struct PokemonDetailView: View {
    var pokeName = ""
    @StateObject var vm: vmPokemonDetail

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("pokeball")
                ForEach(0..<10) {
                    Text("Detalle del pokemon \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: 400, height: 200)
                        .background(.white)
                }
            }
        }
        .frame(height: 350)
        .onAppear(){
            vm.getDetailPokemons(pokeName: self.pokeName)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(vm: vmPokemonDetail())
    }
}
