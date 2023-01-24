//
//  ContentView.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: vmContentView
    var vmPkDetail: vmPokemonDetail
    var body: some View {
        VStack{
            //   Text("PokeList").font(.title).padding()
            Image("pokeLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 100)
            Divider()
            Spacer()
            NavigationStack {
                
                List(self.vm.pokemonList, id: \.uniqueID){ pokemon in
                    NavigationLink(destination: {
                        PokemonDetailView(pokeName: pokemon.name, vm: vmPkDetail)
                    }, label: {
                        VStack(alignment: .leading) {
                            Image("pokeball")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            Text("Nombre:    \(pokemon.name)")
                            Text("Url:    \(pokemon.url)")
                                .font(.subheadline)
                            
                        }.listStyle(InsetGroupedListStyle())
                            .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                    })
                    
                    
                }
                
                .listStyle(.plain)
                .onAppear{
                    self.vm.getPokemons()
                    
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: vmContentView(), vmPkDetail: vmPokemonDetail())
    }
}
