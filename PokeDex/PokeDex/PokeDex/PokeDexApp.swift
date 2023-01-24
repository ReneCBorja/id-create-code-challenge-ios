//
//  PokeDexApp.swift
//  PokeDex
//
//  Created by Rene Borja on 23/1/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: vmContentView(), vmPkDetail: vmPokemonDetail())
        }
    }
}
